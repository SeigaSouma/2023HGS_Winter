//=============================================================================
// 
//  �v���C���[���� [enemy.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "enemy.h"
#include "manager.h"
#include "renderer.h"
#include "game.h"
#include "tutorial.h"
#include "texture.h"
#include "input.h"
#include "calculation.h"
#include "explosion.h"
#include "particle.h"
#include "motion.h"
#include "model.h"
#include "elevation.h"
#include "player.h"
#include "camera.h"
#include "ballast.h"
#include "3D_Effect.h"
#include "hp_gauge.h"
#include "shadow.h"
#include "sound.h"
#include "impactwave.h"
#include "score.h"
#include "bullet.h"
#include "stage.h"
#include "objectX.h"
#include "listmanager.h"
#include "collisionobject.h"
#include "limitereamanager.h"

// �q�N���X
#include "enemy_boss.h"

//==========================================================================
// �������O���
//==========================================================================
namespace
{
	const float PLAYER_SERCH = 800.0f;	// �v���C���[�T���͈�
	const float CHACE_DISTABCE = 50.0f;	// �ǂ��|���鎞�̊Ԋu
}

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CEnemy::CEnemy(int nPriority) : CObjectChara(nPriority)
{
	// �l�̃N���A
	m_posOrigin = D3DXVECTOR3(0.0f, 0.0f, 0.0f);	// �ŏ��̈ʒu
	memset(&m_sFormationInfo, NULL, sizeof(m_sFormationInfo));	// ����̏��
	m_posKnokBack = D3DXVECTOR3(0.0f, 0.0f, 0.0f);	// �m�b�N�o�b�N�̈ʒu
	m_rotOrigin = D3DXVECTOR3(0.0f, 0.0f, 0.0f);	// �ŏ��̌���
	m_type = TYPE_BOSS;	// ���
	m_state = STATE_NONE;	// ���
	m_Oldstate = m_state;	// �O��̏��
	m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);	// �}�e���A���̐F
	m_nCntState = 0;		// ��ԑJ�ڃJ�E���^�[
	m_nTexIdx = 0;			// �e�N�X�`���̃C���f�b�N�X�ԍ�
	m_nNumChild = 0;		// ���̐�
	m_nIdxManager = 0;		// �}�l�[�W���̃C���f�b�N�X�ԍ�
	m_nTargetPlayerIndex = 0;	// �ǂ��|����v���C���[�̃C���f�b�N�X�ԍ�
	m_fActCounter = 0.0f;		// �ړ��J�E���^�[
	m_bAddScore = false;	// �X�R�A���Z���邩�̔���
	m_nBallastEmission = 0;	// ���I�̔����J�E���^�[
	m_sMotionFrag.bJump = false;		// �W�����v�����ǂ���
	m_sMotionFrag.bKnockback = false;	// �m�b�N�o�b�N�����ǂ���
	m_sMotionFrag.bMove = false;		// �ړ������ǂ���
	m_sMotionFrag.bATK = false;			// �U�������ǂ���
	m_pParent = NULL;					// �e�̃|�C���^
	m_pHPGauge = NULL;					// HP�Q�[�W�̏��
	m_pMotion = NULL;					// ���[�V�����̏��
	m_colorType = COLORTYPE_NORMAL;		// �F���Ƃ̎��
	m_pList = NULL;				// ���X�g�̃I�u�W�F�N�g

	memset(&m_pChild[0], NULL, sizeof(m_pChild));	// �q�̃|�C���^
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CEnemy::~CEnemy()
{

}

//==========================================================================
// ��������
//==========================================================================
CEnemy *CEnemy::Create(int nIdx, const char *pFileName, D3DXVECTOR3 pos, TYPE type)
{
	// �����p�̃I�u�W�F�N�g
	CEnemy *pEnemy = NULL;

	if (pEnemy == NULL)
	{// NULL��������

		// �������̊m��
		switch (type)
		{
		case TYPE_BOSS:
			pEnemy = DEBUG_NEW CEnemyBoss;
			break;

		default:
			return NULL;
			break;
		}

		if (pEnemy != NULL)
		{// �������̊m�ۂ��o���Ă�����

			// �C���f�b�N�X�ԍ�
			pEnemy->m_nIdxManager = nIdx;

			// ���
			pEnemy->m_type = type;

			// �ŏ��̈ʒu�ݒ�
			pEnemy->m_posOrigin = pos;

			// �ʒu�ݒ�
			pEnemy->SetPosition(pos);

			// �e�L�X�g�ǂݍ���
			HRESULT hr = pEnemy->RoadText(pFileName);
			if (FAILED(hr))
			{// ���s���Ă�����
				return NULL;
			}

			// ����������
			pEnemy->Init();
		}

		return pEnemy;
	}

	return NULL;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CEnemy::Init(void)
{
	// �e��ϐ��̏�����
	m_state = STATE_NONE;	// ���
	m_Oldstate = STATE_PLAYERCHASE;
	m_nCntState = 0;		// ��ԑJ�ڃJ�E���^�[
	m_posKnokBack = m_posOrigin;	// �m�b�N�o�b�N�̈ʒu
	m_bAddScore = true;	// �X�R�A���Z���邩�̔���

	// ��ނ̐ݒ�
	SetType(TYPE_ENEMY);

	// �����ݒ�
	SetRotation(D3DXVECTOR3(0.0f, 0.0f, 0.0f));

	// �e�̐���
	m_pShadow = CShadow::Create(GetPosition(), GetRadius() * 0.5f);

	// �|�[�Y�̃��Z�b�g
	m_pMotion->ResetPose(0);

	return S_OK;
}

//==========================================================================
// �e�L�X�g�ǂݍ���
//==========================================================================
HRESULT CEnemy::RoadText(const char *pFileName)
{
	// �L�����쐬
	HRESULT hr = SetCharacter(pFileName);

	if (FAILED(hr))
	{// ���s���Ă�����
		return E_FAIL;
	}

	// ���[�V�����̐�������
	m_pMotion = CMotion::Create(pFileName);
	if (m_pMotion == NULL)
	{
		return E_FAIL;
	}

	// �I�u�W�F�N�g�L�����N�^�[�̏��擾
	CObjectChara *pObjChar = GetObjectChara();

	// ���[�V�����̐ݒ�
	m_pMotion->SetModel(pObjChar->GetModel(), pObjChar->GetNumModel(), pObjChar);

	return S_OK;
}

//==========================================================================
// �q�o�^
//==========================================================================
void CEnemy::RegistrChild(CEnemy *pChild)
{
	if (m_nNumChild >= mylib_const::MAX_ENEMY)
	{
		return;
	}

	if (m_pChild[m_nNumChild] == NULL)
	{
		m_pChild[m_nNumChild] = pChild;
		m_nNumChild++;	// �q�̐����Z
	}
	else
	{
		int n = 0;
	}
}

//==========================================================================
// �q�̃��Z�b�g
//==========================================================================
void CEnemy::ResetChild(CEnemy *pChild)
{
	int nMax = m_nNumChild;

	for (int nCntChild = 0; nCntChild < nMax; nCntChild++)
	{
		if (m_pChild[nCntChild] == NULL)
		{
			continue;
		}

		if (m_pChild[nCntChild] == pChild)
		{
			m_pChild[nCntChild] = NULL;
		}
	}
}


//==========================================================================
// �e�̃|�C���^�ݒ�
//==========================================================================
void CEnemy::SetParent(CEnemy *pParent)
{
	if (this != nullptr)
	{
		// �q�̊��蓖��
		if (pParent != NULL)
		{
			pParent->RegistrChild(this);
		}

		// �e�̃|�C���^�n��
		m_pParent = pParent;
		
	}
	else
	{
		int n = 0;
	}
}

//==========================================================================
// �I������
//==========================================================================
void CEnemy::Uninit(void)
{
	int nIdx = m_nIdxManager;

	// �I������
	if (m_pMotion != NULL)
	{
		m_pMotion->Uninit();
		delete m_pMotion;
		m_pMotion = NULL;
	}

	// �e������
	if (m_pShadow != NULL)
	{
		m_pShadow = NULL;
	}

	//if (m_pList != NULL && m_pListManager != NULL)
	//{
	//	// ���X�g������o��
	//	m_pListManager->Pop(m_pList);
	//	m_pList->Uninit();
	//	delete m_pList;
	//	m_pList = NULL;
	//}

	// �I������
	CObjectChara::Uninit();

	// �G�}�l�[�W���擾
	CEnemyManager *pEnemyManager = CGame::GetEnemyManager();

	if (pEnemyManager != NULL)
	{
		// �}�l�[�W���̏I��
		pEnemyManager->Release(nIdx);
	}
}

//==========================================================================
// ���S����
//==========================================================================
void CEnemy::Kill(void)
{
	for (int nCntEnemy = 0; nCntEnemy < mylib_const::MAX_ENEMY; nCntEnemy++)
	{// �q�̐�����

		if (m_pChild[nCntEnemy] != NULL)
		{// �q������ꍇ

			// �����̎q�̐e��NULL�ɂ���
			m_pChild[nCntEnemy]->m_pParent = NULL;
		}
	}

	if (m_pParent != NULL)
	{// �����ɐe������ꍇ

		// �e�̎q��NULL�ɂ���
		m_pParent->ResetChild(this);
	}

	// HP�Q�[�W������
	if (m_pHPGauge != NULL)
	{
		m_pHPGauge->Uninit();
		m_pHPGauge = NULL;
	}

	// �e������
	if (m_pShadow != NULL)
	{
		m_pShadow->Uninit();
		m_pShadow = NULL;
	}
}

//==========================================================================
// �X�V����
//==========================================================================
void CEnemy::Update(void)
{
	// ���S�̔���
	if (IsDeath() == true)
	{// ���S�t���O�������Ă�����
		return;
	}

	// �G�f�B�b�g���͔�����
	if (CGame::GetElevation()->IsEdit())
	{
		return;
	}

	if (!CGame::GetGameManager()->IsControll())
	{// �s���ł���Ƃ�
		return;
	}


	// �ߋ��̈ʒu�ݒ�
	SetOldPosition(GetPosition());

	// �����蔻��
	Collision();

	// ���S�̔���
	if (IsDeath() == true)
	{// ���S�t���O�������Ă�����
		return;
	}

	// ���[�V�����̐ݒ菈��
	MotionSet();

	// ��ԍX�V
	UpdateState();

	// ���S�̔���
	if (IsDeath() == true)
	{// ���S�t���O�������Ă�����
		return;
	}

	if (m_state != STATE_SPAWN &&
		m_state != STATE_SPAWNWAIT)
	{
		// �s���̐ݒ�
		ActionSet();
	}

	// �s���X�V
	UpdateAction();

	// �U������
	Atack();

	// ���[�V�����̍X�V
	m_pMotion->Update();

	// ��ޕʏ���
	UpdateByType();

	// HP�Q�[�W�̈ʒu�X�V
	if (m_pHPGauge != NULL)
	{
		// �ʒu�擾
		D3DXVECTOR3 pos = GetPosition();

		// �̗͎擾
		int nLife = GetLife();

		m_pHPGauge->UpdatePosition(pos, nLife);
	}

	// �e�̈ʒu�X�V
	if (m_pShadow != NULL)
	{
		// �ʒu�擾
		D3DXVECTOR3 pos = GetPosition();
		m_pShadow->SetPosition(D3DXVECTOR3(pos.x, m_pShadow->GetPosition().y, pos.z));
	}

	if (GetPosition().y <= mylib_const::KILL_Y)
	{
		// �G�̏I������
		Kill();
		Uninit();
		return;
	}

	// ��l�̕�
	LimitArea();
}

//==========================================================================
// �����蔻��
//==========================================================================
void CEnemy::Collision(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �d�͏���
	move.y -= mylib_const::GRAVITY;

	// �ʒu�X�V
	pos += move;

	// �����␳
	if (m_state != STATE_SPAWN && m_state != STATE_DMG && m_state != STATE_DEAD)
	{
		move.x += (0.0f - move.x) * 0.25f;
		move.z += (0.0f - move.z) * 0.25f;
	}

	if (move.x >= 0.1f || move.x <= -0.1f ||
		move.z >= 0.1f || move.z <= -0.1f)
	{// �ړ���
		m_sMotionFrag.bMove = true;
	}
	else
	{
		m_sMotionFrag.bMove = false;
	}

	// �����擾
	bool bLand = false;
	float fHeight = CGame::GetElevation()->GetHeight(pos, bLand);

	if (fHeight > pos.y)
	{// �n�ʂ̕���������荂��������

		// �n�ʂ̍����ɕ␳
		if (m_state != STATE_DEAD && m_state != STATE_FADEOUT)
		{
			pos.y = fHeight;
		}

		if (bLand == true)
		{// ���n���Ă���

			// ���n������
			ProcessLanding();

			// �W�����v�g�p�\�ɂ���
			if (m_state != STATE_DMG && m_state != STATE_DEAD)
			{
				move.y = 0.0f;
			}
			m_sMotionFrag.bJump = false;
		}
	}


	if (pos.y <= -800.0f)
	{
		pos.y = -800.0f;
	}

	// �ʒu�ݒ�
	SetPosition(pos);

	// �ړ��ʐݒ�
	SetMove(move);
}

//==========================================================================
// �v���C���[�Ƃ̓����蔻��
//==========================================================================
void CEnemy::CollisionPlayer(void)
{
	if (m_state == STATE_SPAWN || m_state == STATE_DEAD || m_state == STATE_FADEOUT)
	{
		return;
	}

	// �����̏��擾
	D3DXVECTOR3 pos = GetPosition();
	float fRadius = GetRadius();

	// �v���C���[�̎擾
	for (int nCntPlayer = 0; nCntPlayer < mylib_const::MAX_PLAYER; nCntPlayer++)
	{
		CPlayer *pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(nCntPlayer);
		if (pPlayer == NULL)
		{
			continue;
		}

		// �����̏��擾
		D3DXVECTOR3 pos = GetPosition();
		float fRadius = GetRadius();

		// �v���C���[���擾
		D3DXVECTOR3 PlayerPos = pPlayer->GetPosition();
		float PlayerRadius = pPlayer->GetRadius();
		CPlayer::STATE PlayerState = (CPlayer::STATE)pPlayer->GetState();

#if _DEBUG
		//CEffect3D::Create(PlayerPos, mylib_const::DEFAULT_VECTOR3, D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f), PlayerRadius, 2, CEffect3D::MOVEEFFECT_NONE, CEffect3D::TYPE_NULL);
#endif

		// ���̔���
		if (SphereRange(pos, PlayerPos, fRadius, PlayerRadius) &&
			PlayerState != CPlayer::STATE_DEAD &&
			PlayerState != CPlayer::STATE_DMG &&
			PlayerState != CPlayer::STATE_KNOCKBACK &&
			PlayerState != CPlayer::STATE_INVINCIBLE)
		{
			// �q�b�g����
			if (pPlayer->Hit(1) == false)
			{// ����łȂ�������

				// ������шړ��ʐݒ�
				pPlayer->SetMove(D3DXVECTOR3(8.0f, 0.0f, 0.0f));
			}
		}
	}
}

//==========================================================================
// ���n���̏���
//==========================================================================
void CEnemy::ProcessLanding(void)
{
	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �W�����v�g�p�\�ɂ���
	if (m_state != STATE_DMG && m_state != STATE_DEAD)
	{
		move.y = 0.0f;
	}
	m_sMotionFrag.bJump = false;

	// �ړ��ʐݒ�
	SetMove(move);
}

//==========================================================================
// �q�b�g����
//==========================================================================
bool CEnemy::Hit(const int nValue)
{
	// �����擾
	D3DXVECTOR3 rot = GetRotation();
	D3DXVECTOR3 pos = GetPosition();

	// �̗͎擾
	int nLife = GetLife();

	if ((nValue == mylib_const::DMG_BOUNCE && m_state != STATE_DEAD) ||
		(m_state != STATE_DMG && m_state != STATE_DEAD && m_state != STATE_SPAWN && m_state != STATE_FADEOUT))
	{// �Ȃɂ��Ȃ���Ԃ̎�

		// �̗͌��炷
		nLife -= nValue;

		// �̗͐ݒ�
		SetLife(nLife);

		if (nLife > 0)
		{// �̗͂��Ȃ��Ȃ��ĂȂ�������

			//// �_���[�W���Đ�
			//CManager::GetInstance()->GetSound()->PlaySound(CSound::LABEL_SE_DMG01);

			if (m_pHPGauge == NULL)
			{
				// �̗̓Q�[�W
				m_pHPGauge = CHP_Gauge::Create(50.0f, GetLifeOrigin(), 3.0f);
			}
		}

		if (nLife <= 0)
		{// �̗͂��Ȃ��Ȃ�����

			// �q�b�g�X�g�b�v
			CManager::GetInstance()->SetEnableHitStop(5);

			// �U��
			CManager::GetInstance()->GetCamera()->SetShake(5, 10.0f, 0.0f);

			// ���S��Ԃɂ���
			m_state = STATE_DEAD;

			// �J�ڃJ�E���^�[�ݒ�
			m_nCntState = 40;

			// �m�b�N�o�b�N�̈ʒu�X�V
			m_posKnokBack = GetPosition();

			// �m�b�N�o�b�N����ɂ���
			m_sMotionFrag.bKnockback = true;

			// ���ꃂ�[�V����
			//m_pMotion->Set(MOTION_KNOCKBACK);

			// �����Đ�
			CManager::GetInstance()->GetSound()->PlaySound(CSound::LABEL_SE_ENEMYEXPLOSION);

			D3DXVECTOR3 move = GetMove();
			move.x = Random(-5, 5) + 20.0f;
			move.y = Random(0, 5) + 15.0f;
			move.z = Random(-5, 5) + 20.0f;
			SetMove(move);

			// ��������
			return true;
		}

		// �␳
		ValueNormalize(nLife, GetLifeOrigin(), 0);

		// �ߋ��̏�ԕۑ�
		m_Oldstate = m_state;

		// �_���[�W��Ԃɂ���
		m_state = STATE_DMG;

		// �J�ڃJ�E���^�[�ݒ�
		if (nValue == mylib_const::DMG_SLASH)
		{
			m_nCntState = 10;

			// �q�b�g�X�g�b�v
			//CManager::GetInstance()->SetEnableHitStop(2);

			// �U��
			CManager::GetInstance()->GetCamera()->SetShake(5, 8.0f, 0.0f);
		}
		else
		{
			m_nCntState = 30;

			// �q�b�g�X�g�b�v
			CManager::GetInstance()->SetEnableHitStop(5);

			// �U��
			CManager::GetInstance()->GetCamera()->SetShake(10, 15.0f, 0.0f);
		}

		// �m�b�N�o�b�N�̈ʒu�X�V
		m_posKnokBack = GetPosition();

		// ��������
		return true;
	}

	// ����łȂ�
	return false;
}

//==========================================================================
// ��ޕʍX�V����
//==========================================================================
void CEnemy::UpdateByType(void)
{

}

//==========================================================================
// �s���X�V
//==========================================================================
void CEnemy::UpdateAction(void)
{

}

//==========================================================================
// �v���C���[����������
//==========================================================================
void CEnemy::RotationPlayer(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 rot = GetRotation();

	// �v���C���[���
	CPlayer* pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(m_nTargetPlayerIndex);
	if (pPlayer == NULL)
	{
		return;
	}

	// �v���C���[�̈ʒu�擾
	D3DXVECTOR3 posPlayer = pPlayer->GetPosition();

	// �ڕW�̊p�x�����߂�
	float fRotDest = atan2f((pos.x - posPlayer.x), (pos.z - posPlayer.z));

	// �ڕW�Ƃ̍���
	float fRotDiff = fRotDest - rot.y;

	//�p�x�̐��K��
	RotNormalize(fRotDiff);

	//�p�x�̕␳������
	rot.y += fRotDiff * 0.025f;

	// �p�x�̐��K��
	RotNormalize(rot.y);

	// �����ݒ�
	SetRotation(rot);

	// �ڕW�̌����ݒ�
	SetRotDest(fRotDest);
}


//==========================================================================
// �v���C���[�Ƃ̋����𔻒�
//==========================================================================
bool CEnemy::CalcLenPlayer(float fLen)
{
	// �v���C���[���
	CPlayer* pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(m_nTargetPlayerIndex);
	if (pPlayer == NULL)
	{
		return false;
	}

	return CircleRange3D(GetPosition(), pPlayer->GetPosition(), fLen, pPlayer->GetRadius());
}

//==========================================================================
// �ړ���������������
//==========================================================================
void CEnemy::MoveRotation(void)
{
	// �K�v�Ȓl���擾
	D3DXVECTOR3 rot = GetRotation();
	D3DXVECTOR3 move = GetMove();

	// �������Z�o
	float fRot = atan2f(-move.x, -move.z);

	// �p�x�̐��K��
	RotNormalize(fRot);

	// �p�x�̕␳������
	rot.y += (fRot - rot.y) * 0.025f;

	// �����ݒ�
	SetRotation(rot);
}

//==========================================================================
// �ړ�
//==========================================================================
void CEnemy::Move(void)
{
	// �ړ��t���O�𗧂Ă�
	m_sMotionFrag.bMove = true;

	// �ړ����x�擾
	float fMove = GetVelocity();

	// �ړ��ʂ�K�p
	D3DXVECTOR3 move = GetMove();
	move.x = sinf(m_fActCounter) * fMove;
	move.z = cosf(m_fActCounter) * fMove;
	SetMove(move);

	// �����]��
	MoveRotation();
}

//==========================================================================
// ��ԍX�V����
//==========================================================================
void CEnemy::UpdateState(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();
	D3DXVECTOR3 pos11 = D3DXVECTOR3(GetObjectChara()->GetModel()[0]->GetWorldMtx()._41, GetObjectChara()->GetModel()[0]->GetWorldMtx()._42, GetObjectChara()->GetModel()[0]->GetWorldMtx()._43);

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �F�ݒ�
	m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, m_mMatcol.a);

	switch (m_state)
	{
	case STATE_NONE:
		StateNone();
		break;

	case STATE_SPAWNWAIT:	// �X�|�[���ҋ@
		SpawnWait();
		break;

	case STATE_SPAWN:
		Spawn();
		break;

	case STATE_DMG:
		Damage();
		break;

	case STATE_DEAD:
		Dead();
		break;

	case STATE_FADEOUT:
		FadeOut();
		break;

	case STATE_PLAYERCHASE:
		PlayerChase();
		break;

	case STATE_PARENTCHASE:
		ParentChase();
		break;

	case STATE_ATTACK:
		StateAttack();
		break;

	case STATE_WAIT:
		StateWait();
		break;

	case STATE_BASECHANGE:
		ChangeBase();
		break;
	}

	if (m_state != STATE_SPAWNWAIT && IsDisp() == false)
	{
		// �`�悷��
		SetEnableDisp(true);
	}
}

//==========================================================================
// ��ޕʏ�ԍX�V����
//==========================================================================
void CEnemy::UpdateStateByType(void)
{
	return;
}

//==========================================================================
// �����Ȃ����
//==========================================================================
void CEnemy::StateNone(void)
{
	// �F�ݒ�
	m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);

	// ��ԑJ�ڃJ�E���^�[���Z
	m_nCntState--;

	if (m_nCntState <= 0)
	{// �J�ڃJ�E���^�[��0�ɂȂ�����
		m_nCntState = 0;
	}
}

//==========================================================================
// �X�|�[���ҋ@
//==========================================================================
void CEnemy::SpawnWait(void)
{
	// ��ԃJ�E���^�[���Z�b�g
	m_nCntState = 0;

	// �`�悵�Ȃ�
	SetEnableDisp(false);
}

//==========================================================================
// �o��
//==========================================================================
void CEnemy::Spawn(void)
{
	// ���c����ցA�R�s�[���Ă�
#if 0
	int nType = m_pMotion->GetType();
	if (nType == MOTION_SPAWN && m_pMotion->IsFinish() == true)
	{// �o�ꂪ�I����Ă���

		// �ȂɂȂ�
		m_state = STATE_NONE;
		return;
	}

	if (nType != MOTION_SPAWN)
	{
		// �o�ꃂ�[�V�����ݒ�
		m_pMotion->Set(MOTION_SPAWN);
	}
#endif
}

//==========================================================================
// �_���[�W
//==========================================================================
void CEnemy::Damage(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �ڕW�̌����擾
	float fRotDest = GetRotDest();

	// �ړ��ʎ擾
	float fMove = GetVelocity();

	// ���݂ƖڕW�̍���
	float fRotDiff = 0.0f;

	// �����̔���
	bool bLen = false;

#if _DEBUG
	// �F�ݒ�
	m_mMatcol = D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f);
#endif

	// ��ԑJ�ڃJ�E���^�[���Z
	m_nCntState--;

	if (m_nCntState <= 0)
	{// �J�ڃJ�E���^�[��0�ɂȂ�����

		// �ߋ��̏�Ԃɂ���
		m_state = m_Oldstate;
	}

	// �ʒu�ݒ�
	SetPosition(pos);

	// �ړ��ʐݒ�
	SetMove(move);

	// �����ݒ�
	SetRotation(rot);

	// �ڕW�̌����ݒ�
	SetRotDest(fRotDest);
}

//==========================================================================
// ���S
//==========================================================================
void CEnemy::Dead(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �ڕW�̌����擾
	float fRotDest = GetRotDest();

	// �ړ��ʎ擾
	float fMove = GetVelocity();

	// ���݂ƖڕW�̍���
	float fRotDiff = 0.0f;

	// �����̔���
	bool bLen = false;

	// ��ԑJ�ڃJ�E���^�[���Z
	m_nCntState--;

	if (m_nCntState % 6 == 0)
	{
		CEffect3D::Create(pos, D3DXVECTOR3(Random(-10, 10) * 0.1f, -move.y, Random(-10, 10) * 0.1f), D3DXCOLOR(0.2f, 0.2f, 0.2f, 1.0f), (float)Random(80, 120), 20, CEffect3D::MOVEEFFECT_ADD, CEffect3D::TYPE_SMOKEBLACK);
	}

	// �F�ݒ�
	m_mMatcol = D3DXCOLOR(1.0f, 1.0f, 1.0f, m_mMatcol.a);
	m_mMatcol.a -= 1.0f / 80.0f;

	// �d�͂ŗ���
	move.y += -mylib_const::GRAVITY * 0.25f;
	pos.y += move.y;

	// ��]
	rot.y += D3DX_PI * 0.025f;
	rot.x += D3DX_PI * (Random(5, 25) * 0.001f);

	if(CGame::GetElevation()->IsHit(pos))
	{
		// �p�[�e�B�N������
		my_particle::Create(pos, my_particle::TYPE_ENEMY_FADE);

		// �G�̏I������
		m_state = STATE_FADEOUT;
		//Uninit();
		return;
	}


	// �ʒu�ݒ�
	SetPosition(pos);

	// �ړ��ʐݒ�
	SetMove(move);

	// �����ݒ�
	SetRotation(rot);

	// �ڕW�̌����ݒ�
	SetRotDest(fRotDest);
}

//==========================================================================
// �t�F�[�h�A�E�g
//==========================================================================
void CEnemy::FadeOut(void)
{
	// �ړ��ʎ擾
	float fMove = GetVelocity();

	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �t�F�[�h�A�E�g���[�V�����ݒ�
	m_pMotion->Set(MOTION_FADEOUT);

	// �t�F�[�h�A�E�g�̃t���[����
	int nAllFrame = m_pMotion->GetMaxAllCount(MOTION_FADEOUT);
	float fFrame = m_pMotion->GetFrameCount();

	// ���[�V�����̏��擾
	CMotion::Info aInfo = m_pMotion->GetInfo(m_pMotion->GetType());

	// �U�����̑����擾
	int nNumAttackInfo = aInfo.nNumAttackInfo;

	// �����擾
	bool bLand = false;
	float fHeight = CGame::GetElevation()->GetHeight(pos, bLand);

	m_sMotionFrag.bMove = false;	// �ړ�����OFF
	m_sMotionFrag.bATK = false;		// �U������OFF

	// �J�ڃJ�E���^�[���Z
	m_nCntState++;

	// �F�ݒ�
	m_mMatcol.a = 1.0f - ((float)m_nCntState / (float)nAllFrame);

	if (m_nCntState >= nAllFrame)
	{// �J�ڃJ�E���^�[�����[�V�����𒴂�����

		// �X�R�A���Z�̔���I�t
		m_bAddScore = false;

		// �G�̏I������
		Kill();
		Uninit();
		return;
	}
}

//==========================================================================
// �v���C���[�Ǐ]
//==========================================================================
void CEnemy::PlayerChase(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �ڕW�̌����擾
	float fRotDest = GetRotDest();

	// �ړ��ʎ擾
	float fMove = GetVelocity();

	// ���݂ƖڕW�̍���
	float fRotDiff = 0.0f;

	// �����̔���
	bool bLen = false;

	// �v���C���[���
	CPlayer *pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(m_nTargetPlayerIndex);

	// �I�u�W�F�N�g���
	CObject *pObj = NULL;


	// ��ԑJ�ڃJ�E���^�[���Z
	m_nCntState--;

	if (m_nCntState <= 0)
	{// �J�ڃJ�E���^�[��0�ɂȂ�����
		m_nCntState = 0;
	}

	if (pPlayer != NULL)
	{// NULL����Ȃ��Ƃ�

		// �e�̈ʒu�擾
		D3DXVECTOR3 posPlayer = pPlayer->GetPosition();
		CObject *pMyObj = GetObject();

		// �ڕW�̊p�x�����߂�
		fRotDest = atan2f((pos.x - posPlayer.x), (pos.z - posPlayer.z));

		// �ڕW�Ƃ̍���
		fRotDiff = fRotDest - rot.y;

		//�p�x�̐��K��
		RotNormalize(fRotDiff);

		//�p�x�̕␳������
		rot.y += fRotDiff * 0.025f;

		// �p�x�̐��K��
		RotNormalize(rot.y);

		// �����ݒ�
		SetRotation(rot);

		// �U����Ԉڍs����
		ChangeToAttackState();

		// �����Ă�����Ƀ_�b�V��
		if (bLen == false)
		{// �������ۂ���Ă�����

			// �ǂ��|���ړ�����
			ChaseMove(fMove);
		}

		if (CircleRange3D(pos, pPlayer->GetPosition(), 200.0f, PLAYER_SERCH) == false)
		{// �v���C���[�����E�����������
			m_state = STATE_NONE;
		}
	}

	// �ʒu�ݒ�
	SetPosition(pos);

	// �ڕW�̌����ݒ�
	SetRotDest(fRotDest);
}

//==========================================================================
// �e�Ǐ]
//==========================================================================
void CEnemy::ParentChase(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �ڕW�̌����擾
	float fRotDest = GetRotDest();

	// �ړ��ʎ擾
	float fMove = GetVelocity();

	// ���݂ƖڕW�̍���
	float fRotDiff = 0.0f;

	// �����̔���
	bool bLen = false;

	// ���Ȃ藣��Ă邩�̔���
	bool bLongDistance = true;

	// �I�u�W�F�N�g���
	CObject *pObj = NULL;


	// ��ԑJ�ڃJ�E���^�[���Z
	//m_nCntState++;

	if (m_nCntState <= 0)
	{// �J�ڃJ�E���^�[��0�ɂȂ�����
		m_nCntState = 0;
	}

	if (m_pParent != NULL)
	{// �e������ꍇ

		// �e�̈ړ��ʎ擾
		D3DXVECTOR3 moveParent = m_pParent->GetMove();

		// �e�̈ʒu�擾
		D3DXVECTOR3 posParent = m_pParent->GetPosition();

		// �e�̌����擾
		D3DXVECTOR3 rotParent = m_pParent->GetRotation();

		// �ڕW�̈ʒu
		D3DXVECTOR3 posDest;
		posDest = posParent;

		// �ڕW�̊p�x�����߂�
		fRotDest = atan2f((pos.x - posDest.x), (pos.z - posDest.z));

		// �ڕW�Ƃ̍���
		fRotDiff = fRotDest - rot.y;

		//�p�x�̐��K��
		RotNormalize(fRotDiff);

		//�p�x�̕␳������
		rot.y += fRotDiff * 0.025f;

		// �p�x�̐��K��
		RotNormalize(rot.y);

		// �����ݒ�
		SetRotation(rot);

		if (CircleRange3D(pos, posDest, 25.0f, CHACE_DISTABCE) == true)
			{// ��苗���Ԃɐe����������
				bLen = true;	// ��������
			}

			// �����Ă�����Ƀ_�b�V��
			if (bLen == false)
			{// �������ۂ���Ă�����

				// �ǂ��|���ړ�����
				ChaseMove(fMove * 1.4f);
			}

	}
	else
	{// �������g���e�̎�

		float fRotDiff = 0.0f;	// ���݂ƖڕW�̍���

		// ��ԑJ�ڃJ�E���^�[�X�V
		m_nCntState = (m_nCntState + 1) % 120;

		// �ڕW�̊p�x�����߂�
		if (m_nCntState == 0)
		{
			fRotDest = Random(-31, 31) * 0.1f;
		}

		// �ڕW�Ƃ̍���
		fRotDiff = fRotDest - rot.y;

		//�p�x�̐��K��
		RotNormalize(fRotDiff);

		//�p�x�̕␳������
		rot.y += fRotDiff * 0.025f;

		// �p�x�̐��K��
		RotNormalize(rot.y);

		// �����ݒ�
		SetRotation(rot);

		// �ǂ��|���ړ�����
		ChaseMove(fMove);

#if _DEBUG
		// �F�ݒ�
		m_mMatcol = D3DXCOLOR(1.0f, 0.5f, 1.0f, 1.0f);
#endif
	}

	if (m_colorType == COLORTYPE_POISON ||
		m_colorType == COLORTYPE_CONFUSION)
	{// �ŃL�m�R�͍U���I

		// �v���C���[�Ǐ]�̔���
		TriggerChasePlayer();
	}

	// �ڕW�̌����ݒ�
	SetRotDest(fRotDest);
}

//==========================================================================
// �U������
//==========================================================================
void CEnemy::StateAttack(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �ڕW�̌����擾
	float fRotDest = GetRotDest();

	// �ړ��ʎ擾
	float fMove = GetVelocity();

	// ���݂ƖڕW�̍���
	float fRotDiff = 0.0f;

	// �����̔���
	bool bLen = false;

	// �I�u�W�F�N�g���
	CObject *pObj = NULL;

	// ���݂̎�ގ擾
	int nType = m_pMotion->GetType();

	if (m_pParent != NULL)
	{// �e������ꍇ

		// �e���ǂ��|����Ԃɂ���
		if (m_pParent->m_state != STATE_ATTACK)
		{
			if (m_pParent->m_state != STATE_DMG && m_pParent->m_state != STATE_DEAD)
			{
				m_pParent->m_state = STATE_PLAYERCHASE;
				m_pParent->m_nCntState = 60;
			}

			for (int nCntEnemy = 0; nCntEnemy < m_pParent->m_nNumChild; nCntEnemy++)
			{// �q�̐�����
				if (m_pParent->m_pChild[nCntEnemy] == NULL)
				{
					continue;
				}

				if (m_pParent->m_pChild[nCntEnemy]->m_state == STATE_DMG || m_pParent->m_pChild[nCntEnemy]->m_state == STATE_DEAD)
				{
					continue;
				}

				m_pParent->m_pChild[nCntEnemy]->m_state = STATE_PLAYERCHASE;
				m_pParent->m_pChild[nCntEnemy]->m_nCntState = 60;
			}
		}
	}
	else
	{// �������e�ȏꍇ

		for (int nCntEnemy = 0; nCntEnemy < m_nNumChild; nCntEnemy++)
		{// �q�̐�����

			if (m_pChild[nCntEnemy] == NULL)
			{// NULL��������
				continue;
			}

			if (m_pChild[nCntEnemy]->m_state != STATE_ATTACK)
			{// �U����Ԃ̎�

				if (m_pChild[nCntEnemy]->m_state != STATE_DMG && m_pChild[nCntEnemy]->m_state != STATE_DEAD)
				{
					m_pChild[nCntEnemy]->m_state = STATE_PLAYERCHASE;
					m_pChild[nCntEnemy]->m_nCntState = 60;
				}
			}
		}
	}

	// �v���C���[���
	for (int nCntPlayer = 0; nCntPlayer < mylib_const::MAX_PLAYER; nCntPlayer++)
	{
		CPlayer *pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(nCntPlayer);
		if (pPlayer == NULL)
		{
			continue;
		}

		if (nType == 0 && pPlayer != NULL)
		{// �j���[�g�����ɖ߂��

			if (CircleRange3D(pos, pPlayer->GetPosition(), 400.0f, PLAYER_SERCH) == false)
			{// �v���C���[�Ɨ��ꂷ���Ă�����

				// �Ԋu���������Ԃɂ���
				m_state = STATE_NONE;
				break;
			}
			else
			{// �܂��ǂ��鎞

				m_state = STATE_PLAYERCHASE;

				if (m_pParent != NULL)
				{// �e������ꍇ

					// �e���ǂ��|����Ԃɂ���
					if (m_pParent->m_state != STATE_DMG && m_pParent->m_state != STATE_DEAD)
					{
						m_pParent->m_state = STATE_PLAYERCHASE;
					}

					for (int nCntEnemy = 0; nCntEnemy < m_pParent->m_nNumChild; nCntEnemy++)
					{// �q�̐�����

						if (m_pParent->m_pChild[nCntEnemy] == NULL)
						{
							continue;
						}

						if (m_pParent->m_pChild[nCntEnemy]->m_state == STATE_DMG || m_pParent->m_pChild[nCntEnemy]->m_state == STATE_DEAD)
						{
							continue;
						}

						m_pParent->m_pChild[nCntEnemy]->m_state = STATE_PLAYERCHASE;
					}
				}
				else
				{// �������e�ȏꍇ

					for (int nCntEnemy = 0; nCntEnemy < m_nNumChild; nCntEnemy++)
					{// �q�̐�����

						if (m_pChild[nCntEnemy] == NULL)
						{
							continue;
						}

						if (m_pChild[nCntEnemy]->m_state == STATE_DMG || m_pChild[nCntEnemy]->m_state == STATE_DEAD)
						{
							continue;
						}

						m_pChild[nCntEnemy]->m_state = STATE_PLAYERCHASE;
					}
				}
			}
		}
	}

	// �ʒu�ݒ�
	SetPosition(pos);

	// �ړ��ʐݒ�
	SetMove(move);

	// �����ݒ�
	SetRotation(rot);

	// �ڕW�̌����ݒ�
	SetRotDest(fRotDest);
}

//==========================================================================
// ��ޕʏ�ԍX�V����
//==========================================================================
void CEnemy::StateWait(void)
{
	return;
}

//==========================================================================
// ���_�؂�ւ�
//==========================================================================
void CEnemy::ChangeBase(void)
{
	return;
}


//==========================================================================
// �v���C���[�Ǐ]ON�ɂ���g���K�[
//==========================================================================
void CEnemy::TriggerChasePlayer(void)
{

	// �v���C���[���
	for (int nCntPlayer = 0; nCntPlayer < mylib_const::MAX_PLAYER; nCntPlayer++)
	{
		CPlayer *pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(nCntPlayer);

		// �ʒu�擾
		D3DXVECTOR3 pos = GetPosition();

		if (pPlayer != NULL)
		{// NULL����Ȃ��Ƃ�

			float fRadius = PLAYER_SERCH;

			if (CircleRange3D(pos, pPlayer->GetPosition(), 200.0f, fRadius) == true)
			{// �v���C���[���͈͂ɓ����
				m_state = STATE_PLAYERCHASE;

				if (m_pParent != NULL)
				{// �e������ꍇ

					// �e���ǂ��|����Ԃɂ���
					if (m_pParent->m_state != STATE_DMG && m_pParent->m_state != STATE_DEAD)
					{
						m_pParent->m_state = STATE_PLAYERCHASE;
					}

					for (int nCntEnemy = 0; nCntEnemy < m_pParent->m_nNumChild; nCntEnemy++)
					{// �q�̐�����

						if (m_pParent->m_pChild[nCntEnemy] == NULL)
						{
							continue;
						}

						if (m_pParent->m_pChild[nCntEnemy]->m_state == STATE_DMG || m_pParent->m_pChild[nCntEnemy]->m_state == STATE_DEAD)
						{
							continue;
						}

						// �����̐e�̎q���v���C���[�ǂ��|�����
						m_pParent->m_pChild[nCntEnemy]->m_state = STATE_PLAYERCHASE;
					}
				}
				else
				{// �������e�ȏꍇ

					for (int nCntEnemy = 0; nCntEnemy < m_nNumChild; nCntEnemy++)
					{// �q�̐�����

						if (m_pChild[nCntEnemy] == NULL)
						{
							continue;
						}

						if (m_pChild[nCntEnemy]->m_state == STATE_DMG || m_pChild[nCntEnemy]->m_state == STATE_DEAD)
						{
							continue;
						}

						m_pChild[nCntEnemy]->m_state = STATE_PLAYERCHASE;
					}
				}

				// �ǂ��|����v���C���[�̔ԍ��ݒ�
				m_nTargetPlayerIndex = nCntPlayer;
				break;
			}
		}
	}
}

//==========================================================================
// �U����Ԉڍs����
//==========================================================================
void CEnemy::ChangeToAttackState(void)
{
	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �v���C���[���
	for (int nCntPlayer = 0; nCntPlayer < mylib_const::MAX_PLAYER; nCntPlayer++)
	{
		CPlayer *pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(nCntPlayer);
		if (pPlayer == NULL)
		{
			continue;
		}

		// �e�̈ʒu�擾
		D3DXVECTOR3 posPlayer = pPlayer->GetPosition();

		if (CircleRange3D(pos, posPlayer, 400.0f, pPlayer->GetRadius()) == true && m_sMotionFrag.bJump == false)
		{// ��苗���ԂɃv���C���[����������

			// �U����Ԃɂ���
			m_state = STATE_ATTACK;
			m_sMotionFrag.bATK = true;

			// �ǂ��|����v���C���[�̔ԍ��ݒ�
			m_nTargetPlayerIndex = nCntPlayer;
			break;
		}
	}
}

//==========================================================================
// �ǂ��|���ړ�
//==========================================================================
void CEnemy::ChaseMove(float fMove)
{
	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// �ړ��ʉ��Z
	move.x += sinf(D3DX_PI + rot.y) * fMove;
	move.z += cosf(D3DX_PI + rot.y) * fMove;

	// �ړ��ʐݒ�
	SetMove(move);
}

//==========================================================================
// �U��
//==========================================================================
void CEnemy::Atack(void)
{
	if (m_pMotion == NULL)
	{
		return;
	}

	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// �����擾
	D3DXVECTOR3 rot = GetRotation();

	// �ړ��ʎ擾
	D3DXVECTOR3 move = GetMove();

	// ���[�V�����̏��擾
	CMotion::Info aInfo = m_pMotion->GetInfo(m_pMotion->GetType());

	// �U�����̑����擾
	int nNumAttackInfo = aInfo.nNumAttackInfo;

	for (int nCntAttack = 0; nCntAttack < nNumAttackInfo; nCntAttack++)
	{
		if (aInfo.AttackInfo[nCntAttack] == NULL)
		{// NULL��������
			continue;
		}

		// �U�����ۑ�
		CMotion::AttackInfo atkInfo = *aInfo.AttackInfo[nCntAttack];

		if (m_pMotion->GetAllCount() == aInfo.AttackInfo[nCntAttack]->nInpactCnt)
		{// �Ռ��̃J�E���g�Ɠ����Ƃ�

			// �U��������
			AttackAction(atkInfo.nCollisionNum, atkInfo);
		}

		// ���[�V�����J�E���^�[�擾
		if (m_pMotion->GetAllCount() > aInfo.AttackInfo[nCntAttack]->nMinCnt && m_pMotion->GetAllCount() < aInfo.AttackInfo[nCntAttack]->nMaxCnt)
		{// �U�����蒆

			// �U�����蒆����
			AttackInDicision(*aInfo.AttackInfo[nCntAttack]);
		}
	}

	// �����ݒ�
	SetRotation(rot);
}

//==========================================================================
//  ��l�̕�
//==========================================================================
void CEnemy::LimitArea(void)
{
	// ���g�̒l���擾
	D3DXVECTOR3 pos = GetPosition();

	// ��l�̕�
	CLimitAreaManager *pLimitManager = CGame::GetLimitEreaManager();
	CLimitArea** ppLimit = pLimitManager->GetLimitErea();

	// �����擾
	int nNumAll = pLimitManager->GetNumAll();
	int i = -1, nCntErea = 0;

	while (1)
	{
		if (nCntErea >= nNumAll)
		{// ������������I���
			break;
		}

		// �C���f�b�N�X���Z
		i++;
		if (ppLimit[i] == NULL)
		{
			continue;
		}
		CLimitArea::sLimitEreaInfo info = ppLimit[i]->GetLimitEreaInfo();

		// ��l�̕ǂ�K�p
		if (pos.x + GetRadius() >= info.fMaxX) { pos.x = info.fMaxX - GetRadius(); }
		if (pos.x - GetRadius() <= info.fMinX) { pos.x = info.fMinX + GetRadius(); }
		if (pos.z + GetRadius() >= info.fMaxZ) { pos.z = info.fMaxZ - GetRadius(); }
		if (pos.z - GetRadius() <= info.fMinZ) { pos.z = info.fMinZ + GetRadius(); }

		// �G���A�̐����Z
		nCntErea++;
	}

	// �l��K�p
	SetPosition(pos);
}

//==========================================================================
// �U��������
//==========================================================================
void CEnemy::AttackAction(int nModelNum, CMotion::AttackInfo ATKInfo)
{
	return;
}

//==========================================================================
// �U�����蒆����
//==========================================================================
void CEnemy::AttackInDicision(CMotion::AttackInfo ATKInfo)
{

	// �ʒu�擾
	D3DXVECTOR3 pos = GetPosition();

	// ����̈ʒu
	D3DXVECTOR3 weponpos = m_pMotion->GetAttackPosition(GetModel(), ATKInfo);

	if (ATKInfo.fRangeSize == 0.0f)
	{
		return;
	}

#if _DEBUG
	//CEffect3D::Create(weponpos, D3DXVECTOR3(0.0f, 0.0f, 0.0f), D3DXCOLOR(1.0f, 0.0f, 0.0f, 1.0f), ATKInfo.fRangeSize, 10, CEffect3D::MOVEEFFECT_NONE, CEffect3D::TYPE_NORMAL);
#endif

	// �v���C���[���
	for (int nCntPlayer = 0; nCntPlayer < mylib_const::MAX_PLAYER; nCntPlayer++)
	{
		CPlayer *pPlayer = CManager::GetInstance()->GetScene()->GetPlayer(nCntPlayer);
		if (pPlayer == NULL)
		{
			continue;
		}

		// �v���C���[�̌���
		D3DXVECTOR3 PlayerPos = pPlayer->GetRotation();

		// ����T�C�Y�擾
		float fRadius = pPlayer->GetRadius();

		if (SphereRange(weponpos, PlayerPos, ATKInfo.fRangeSize, fRadius))
		{// ���̔���

			// �v���C���[�̌���
			D3DXVECTOR3 PlayerRot = pPlayer->GetRotation();

			// �^�[�Q�b�g�ƓG�Ƃ̌���
			float fRot = atan2f((pos.x - PlayerPos.x), (pos.z - PlayerPos.z));

			// �����𐳖ʂɂ���
			fRot = D3DX_PI + fRot;

			// �p�x�̐��K��
			RotNormalize(fRot);

			// �����ݒ�
			pPlayer->SetRotation(D3DXVECTOR3(PlayerRot.x, fRot, PlayerRot.z));
			fRot = pPlayer->GetRotation().y;

			// ������΂�
			pPlayer->SetMove(D3DXVECTOR3(
				sinf(fRot) * 4.0f,
				12.0f,
				cosf(fRot) * 4.0f));

			if (pPlayer->Hit(ATKInfo.nDamage) == true)
			{// ����ł���

				// �Ȃ񂩂���
				//my_particle::Create(TargetPos, my_particle::TYPE_OFFSETTING);
			}

		}
	}
}

//==========================================================================
// �`�揈��
//==========================================================================
void CEnemy::Draw(void)
{
#if _DEBUG
	if (m_state == STATE_FADEOUT)
	{
		CObjectChara::Draw(m_mMatcol.a);
	}
	else if (m_mMatcol != D3DXCOLOR(1.0f, 1.0f, 1.0f, m_mMatcol.a))
	{
		// �I�u�W�F�N�g�L�����̕`��
		CObjectChara::Draw(m_mMatcol);
	}
	else
	{
		// �I�u�W�F�N�g�L�����̕`��
		CObjectChara::Draw();
	}
#else
	//CObjectChara::Draw();

	if (m_mMatcol != D3DXCOLOR(1.0f, 1.0f, 1.0f, m_mMatcol.a))
	{
		// �I�u�W�F�N�g�L�����̕`��
		CObjectChara::Draw(m_mMatcol);
	}
	else
	{
		// �I�u�W�F�N�g�L�����̕`��
		CObjectChara::Draw();
	}
#endif
}

//==========================================================================
// ��Ԏ擾
//==========================================================================
int CEnemy::GetState(void)
{
	return m_state;
}

//==========================================================================
// ���̌���
//==========================================================================
void CEnemy::SetOriginRotation(D3DXVECTOR3 rot)
{
	m_rotOrigin = rot;
}

//==========================================================================
// �X�|�[���n�_�ݒ�
//==========================================================================
void CEnemy::SetSpawnPosition(D3DXVECTOR3 pos)
{
	m_posOrigin = pos;
}

//==========================================================================
// �X�|�[���n�_�擾
//==========================================================================
D3DXVECTOR3 CEnemy::GetSpawnPosition(void)
{
	return m_posOrigin;
}

//==========================================================================
// ��Ԑݒ�
//==========================================================================
void CEnemy::SetState(STATE state)
{
	m_state = (STATE)state;
}

//==========================================================================
// ��Ԑݒ�
//==========================================================================
void CEnemy::SetState(STATE state, int nCntState)
{
	m_state = state;
	m_nCntState = nCntState;
}

//==========================================================================
// ��ގ擾
//==========================================================================
int CEnemy::GetCharaType(void)
{
	return m_type;
}

//==========================================================================
// �G�̏��擾
//==========================================================================
CEnemy *CEnemy::GetEnemy(void)
{
	// �������g�̃|�C���^���擾
	return this;
}