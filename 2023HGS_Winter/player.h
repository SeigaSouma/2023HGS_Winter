//=============================================================================
// 
//  プレイヤーヘッダー [player.h]
//  Author : 相馬靜雅
// 
//=============================================================================

#ifndef _PLAYER_H_
#define _PLAYER_H_	// 二重インクルード防止

#include "gamemanager.h"
#include "objectChara.h"
#include "motion.h"

//==========================================================================
// 前方宣言
//==========================================================================
class CShadow;
class CTargetPoint;
class CHP_GaugePlayer;

//==========================================================================
// クラス定義
//==========================================================================
// プレイヤークラス定義
class CPlayer : public CObjectChara
{
protected:
	// 列挙型定義
	enum MOTION
	{
		MOTION_DEF = 0,			// ニュートラルモーション
		MOTION_WALK,			// 移動モーション
		MOTION_ATK,				// 攻撃
		MOTION_ATK2,			// 攻撃(派生)
		MOTION_KNOCKBACK,		// やられモーション
		MOTION_DEAD,			// 死亡モーション
		MOTION_JUMP,			// ジャンプ
		MOTION_FALL,			// 落下中
		MOTION_EVOLUTION,		// 進化中
		MOTION_MAX
	};

	// モーションの判定
	struct SMotionFrag
	{
		bool bJump;			// ジャンプ中かどうか
		bool bATK;			// 攻撃中かどうか
		bool bKnockBack;	// ノックバック中かどうか
		bool bDead;			// 死亡中かどうか
		bool bMove;			// 移動中かどうか
	};

public:

	// 状態定義
	enum STATE
	{
		STATE_NONE = 0,		// なにもない
		STATE_INVINCIBLE,	// 無敵
		STATE_DMG,			// ダメージ
		STATE_KNOCKBACK,	// ノックバック
		STATE_DEAD,			// 死
		STATE_FADEOUT,		// フェードアウト
		STATE_ATTACK,		// 攻撃処理
		STATE_MAX
	};

	CPlayer(int nPriority = mylib_const::PRIORITY_DEF2D);
	~CPlayer();

	// オーバーライドされた関数
	virtual HRESULT Init(void);
	virtual void Uninit(void);
	virtual void Update(void);
	virtual void Draw(void);
	bool Hit(const int nValue);	// ヒット処理
	virtual int GetState(void) override;

	void SetState(STATE state, int nCntState = 0);	// 状態設定
	static CPlayer *Create(int nIdx);	// 生成
	void UninitByMode(void);			// モード別終了
	virtual void Kill(void);			// 死亡処理

protected:

	bool Collision(D3DXVECTOR3 &pos, D3DXVECTOR3 &move);	// 当たり判定

	void UpdateState(void);	// 状態更新処理
	void MotionSet(void);	// モーションの設定
	void Atack(void);		// 攻撃

	bool m_bJump;				// ジャンプ中かどうか
	bool m_bLandOld;			// 過去の着地情報
	bool m_bHitStage;			// ステージの当たり判定
	bool m_bLandField;			// フィールドの着地判定
	bool m_bHitWall;			// 壁の当たり判定
	int m_nMyPlayerIdx;			// プレイヤーインデックス番号
	int m_nCntWalk;				// 歩行カウンター
	STATE m_state;				// 状態
	CMotion *m_pMotion;			// モーションの情報
	CShadow *m_pShadow;			// 影の情報
	SMotionFrag m_sMotionFrag;	// モーションのフラグ
private:

	// メンバ関数
	void KnockBack(void);	// ノックバック
	void Damage(void);		// ダメージ
	void Dead(void);		// 死亡
	void FadeOut(void);		// フェードアウト
	void Invincible(void);	// 無敵
	virtual void Controll(void);	// 操作

	void ChangeMotion(const char* pMotionFile);	// モーションファイル変更

	STATE m_Oldstate;			// 前回の状態
	D3DXCOLOR m_mMatcol;		// マテリアルの色
	D3DXVECTOR3 m_posKnokBack;	// ノックバックの位置
	D3DXVECTOR3 m_KnokBackMove;	// ノックバックの移動量
	int m_nCntState;			// 状態遷移カウンター
	CTargetPoint *m_pTargetP;	// 目標の地点
};



#endif