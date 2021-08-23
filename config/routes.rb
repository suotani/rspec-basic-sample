Rails.application.routes.draw do
  devise_for :users
  resources :todos
  resources :users, only: [:index]
 
  get "/nums", to: "calcs#new"
  post "/nums", to: "calcs#exec"
  post "/nums2", to: "calcs#exec2"
  post "/nums3", to: "calcs#exec3"
  post "/nums4", to: "calcs#exec4"

  # ルーティング
  resources :likes, only: [:index, :create, :destroy]
  # リクエスト
  # todos/show(詳細画面) ボタン(リンク) どのtodoなのか(todoのid)
  # レスポンス
  # likeモデルのレコードを1つcreateする
  # 詳細画面へリダイレクト


  # いいねの取り消し
  # ルーティング
  # like destroy
  # リクエスト
  # todos/show(詳細画面) ボタン(リンク) どのtodoなのか(todoのid)
  # レスポンス
  # 対象となるlikeのレコードを削除
  # 詳細画面へリダイレクト

  # いいねしたもの一覧
  # ルーティング
  # いいねしたものの一覧
  # リクエスト
  # todoの一覧にリンク
  # レスポンス
  # いいねの一覧画面



end
