//=============================================================================
// 
//  敵の拠点ヘッダー [enemybase.h]
//  Author : 相馬靜雅
// 
//=============================================================================

#ifndef _ENEMYBASE_H_
#define _ENEMYBASE_H_	// 二重インクルード防止

#include "main.h"
#include "constans.h"
#include "object.h"

//==========================================================================
// 前方宣言
//==========================================================================
class CDebugPointNumber;

//==========================================================================
// クラス定義
//==========================================================================
// カメラの軸クラス定義
class CEnemyBase
{
public:

	// 構造体定義
	struct sInfo
	{
		D3DXVECTOR3 pos;		// 位置
		D3DXVECTOR3 rot;		// 向き
		int nPattern;			// 種類
		int nRush;				// ラッシュ用かどうか
	};

	CEnemyBase();
	~CEnemyBase();

	HRESULT Init(void);
	void Uninit(void);
	void Update(void);

	void CreatePos(int nStage, int nPattern, D3DXVECTOR3 pos, int nRush);	// 位置作成
	void DeletePos(int nStage, int nIdx);					// 位置削除
	HRESULT ReadText(const char *pFileName);	// 外部ファイル読み込み処理
	void Save(void);			// 外部ファイル書き出し処理

	static CEnemyBase *Create(const char *pFileName);
	int GetSpawnPointNum(void);			// 位置数取得
	D3DXVECTOR3 GetSpawnPoint(int nStage, int nIdx);	// 位置取得
	void SetSpawnPoint(int nStage, int nIdx, D3DXVECTOR3 pos);	// 位置設定
	sInfo GetEnemyBaseInfo(int nStage, int nIdx);	// 変更の情報取得

	int GetNumBase(int nStage) { return m_nBaseNum[nStage]; }	// ステージ毎の拠点の数取得
	int GetNumStage(void) { return m_nNumStage; }	// ステージの総数取得
	int GetNumAll(void) { return m_nNumAll; }	// 総数取得
private:

	std::vector<std::vector<sInfo>> m_EnemyBaseInfo;		// 拠点の情報
	CObjectX *m_apObjX[mylib_const::MAX_CAMERAAXIS];	// オブジェクトX
	CDebugPointNumber *m_pMultiNumber[mylib_const::MAX_CAMERAAXIS];

	int m_nNumStage;	// ステージの総数
	std::vector<int> m_nBaseNum;	// 拠点の数
	int m_nNumAll;		// 総数
};



#endif