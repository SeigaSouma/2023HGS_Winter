//=============================================================================
// 
//  ランキングマネージャ処理 [rankingmanager.cpp]
//  Author : 相馬靜雅
// 
//=============================================================================
#include "debugproc.h"
#include "rankingmanager.h"
#include "calculation.h"

//==========================================================================
// マクロ定義
//==========================================================================

//==========================================================================
// 静的メンバ変数宣言
//==========================================================================

//==========================================================================
// コンストラクタ
//==========================================================================
CRankingManager::CRankingManager()
{
	// 値のクリア
	m_nNowScore = 0;	// 今回のスコア

}

//==========================================================================
// デストラクタ
//==========================================================================
CRankingManager::~CRankingManager()
{

}

//==========================================================================
// 生成処理
//==========================================================================
CRankingManager *CRankingManager::Create(void)
{
	// 生成用のオブジェクト
	CRankingManager *pManager = NULL;

	if (pManager == NULL)
	{// NULLだったら

		// メモリの確保
		pManager = DEBUG_NEW CRankingManager;

		if (pManager != NULL)
		{// メモリの確保が出来ていたら

			// 初期化処理
			HRESULT hr = pManager->Init();

			if (FAILED(hr))
			{// 失敗していたら
				return NULL;
			}
		}

		return pManager;
	}

	return NULL;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CRankingManager::Init(void)
{
	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CRankingManager::Uninit(void)
{

}

//==========================================================================
// リセット
//==========================================================================
void CRankingManager::Reset(void)
{
	// 値のクリア
	m_nNowScore = 0;	// 今回のスコア
}

//==========================================================================
// 更新処理
//==========================================================================
void CRankingManager::Update(void)
{
	
}

//==========================================================================
// 今回のスコア設定
//==========================================================================
void CRankingManager::SetNowScore(int nScore)
{
	m_nNowScore = nScore;
}

//==========================================================================
// 今回のスコア取得
//==========================================================================
int CRankingManager::GetNowScore(void)
{
	return m_nNowScore;
}