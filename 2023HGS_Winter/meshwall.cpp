//=============================================================================
// 
//  ���b�V���E�H�[������ [meshwall.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "meshwall.h"
#include "manager.h"
#include "renderer.h"
#include "texture.h"

//==========================================================================
// �����l�[���X�y�[�X
//==========================================================================
namespace
{
	const char* TEXTURE_DEFAULT = "data\\TEXTURE\\glass.jpg";	// �f�t�H���g�e�N�X�`��
}

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CMeshWall::CMeshWall(int nPriority) : CObject3DMesh(nPriority)
{
	m_nTexIdx = 0;	// �e�N�X�`���̃C���f�b�N�X�ԍ�
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CMeshWall::~CMeshWall()
{

}

//==========================================================================
// ��������
//==========================================================================
CMeshWall *CMeshWall::Create(D3DXVECTOR3 pos, D3DXVECTOR3 rot, float fWidthLen, float fHeightLen, int nWidth, int nHeight, int nPriority, const char *aFileName)
{
	// �����p�̃I�u�W�F�N�g
	CMeshWall *pObjMeshField = NULL;

	if (pObjMeshField == NULL)
	{// NULL��������

		// �������̊m��
		pObjMeshField = DEBUG_NEW CMeshWall;

		if (pObjMeshField != NULL)
		{// �������̊m�ۂ��o���Ă�����

			// �ʒu�E����
			pObjMeshField->SetPosition(pos);
			//pObjMeshField->SetRotation(rot);
			pObjMeshField->SetOriginRotation(rot);
			pObjMeshField->SetWidthBlock(nWidth);
			pObjMeshField->SetHeightBlock(nHeight);
			pObjMeshField->SetWidthLen(fWidthLen);
			pObjMeshField->SetHeightLen(fHeightLen);

			if (aFileName == NULL)
			{// NULL��������

				// �e�N�X�`���̊��蓖��
				pObjMeshField->m_nTexIdx = CManager::GetInstance()->GetTexture()->Regist(TEXTURE_DEFAULT);
			}
			else
			{// �t�@�C�����������Ă�����

				// �e�N�X�`���̊��蓖��
				pObjMeshField->m_nTexIdx = CManager::GetInstance()->GetTexture()->Regist(aFileName);
			}

			// �e�N�X�`���̊��蓖��
			pObjMeshField->BindTexture(pObjMeshField->m_nTexIdx);

			// ����������
			pObjMeshField->Init();
		}

		return pObjMeshField;
	}

	return NULL;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CMeshWall::Init(void)
{
	HRESULT hr;

	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// ��ސݒ�
	SetType(TYPE_MESHWALL);

	// �I�u�W�F�N�g3D���b�V���̏���������
	hr = CObject3DMesh::Init(CObject3DMesh::TYPE_WALL);
	if (FAILED(hr))
	{// ���s���Ă�����
		return E_FAIL;
	}

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CMeshWall::Uninit(void)
{
	// �I������
	CObject3DMesh::Uninit();
}

//==========================================================================
// �X�V����
//==========================================================================
void CMeshWall::Update(void)
{
	// ���_���ݒ�
	SetVtx();
}

//==========================================================================
// �`�揈��
//==========================================================================
void CMeshWall::Draw(void)
{
	// �`�揈��
	CObject3DMesh::Draw();
}

//==========================================================================
// ���_���ݒ菈��
//==========================================================================
void CMeshWall::SetVtx(void)
{
	// ���_���X�V
	CObject3DMesh::SetVtx();
}

//==========================================================================
// ���b�V���t�B�[���h�I�u�W�F�N�g�̎擾
//==========================================================================
CMeshWall *CMeshWall::GetMyObject(void)
{
	return this;
}