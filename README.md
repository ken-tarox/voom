# 温泉クチコミアプリ・ONSENO

![IMG_2210](https://user-images.githubusercontent.com/65398086/98610046-1609a580-2332-11eb-919b-2396239e1747.png)

### **URL&ensp;<https://onsenos.herokuapp.com>**

## サービス概要

ONSENO・オンセノは温泉クチコミアプリです。全国各地に点在する温泉情報を利用者同士でシェアすることができます。

#### ONSENO の主な機能

- 温泉検索
- My 温泉登録（温泉投稿）
- クチコミ投稿
- 温泉評価（星評価）
- お気に入り追加

## 開発環境

- Ruby 2.6.5
- Rails 6.0.3.3
- MySQL2 8.0.29
- GitHub
- Heroku
- AWS S3

## 使い方

- メールアドレス : guest@guest.com
- パスワード : guesttest
  上記でテストログイン可能です（管理者ログインではありません）。

## 導入機能

- ユーザー登録
- ログイン・アウト
- メール認証
- メール送信（gmai←Sendgrid のアカウントが作成できなかったため）
- パスワード再登録
- Remember 機能
- ユーザー情報編集
- 記事一覧表示
- 管理者機能
- 画像アップロード(CarrierWave)
- ページネーション
- お気に入り登録
- 温泉投稿
- クチコミ投稿
- 星評価機能(raty)
- 検索絞り込み機能
- 温泉投稿スライド表示(Slick)
- 入力住所から Gmap を表示(geocoder)
