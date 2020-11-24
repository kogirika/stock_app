# README

## アプリ名
Stock_app
<br /><br />


## 概要
日用品、食品、趣味の在庫を管理できます。
<br /><br />

## 本番環境
| 項目 | 内容 |
| --  |  -- |
| URL | https://stock-29227.herokuapp.com/ |
| Basic認証のIDとパスワード | admin<br>2323 |
| デモユーザーのメールアドレス<br>パスワード<br>ユーザー名 |hoge@example.com<br>hoge12<br>hoge|
<br /><br />

## 制作背景
在庫を管理することで、賢く買い物することができます。  
悩み : コード決済のキャンペーンなどで買いだめすると重複購入や買い漏らしが発生していました。  
解決 : 在庫を簡単に管理し、出先でも確認できるようにすることで悩み解消できます。  
<br /><br />


## DEMO
<img src="https://user-images.githubusercontent.com/67131613/94334985-16184500-0013-11eb-8ce3-8130fc3b356a.gif" width="480px">
<br />


## 工夫したポイント
- 簡単な管理を目指し、メインでのページで登録、削除を行えるようにしました。
- 価格は任意としましたが、入力時にはバリデーションをかけるようにしました。
- ＋、−ボタンを押すことで、在庫数を変更できるようにしました。
- 在庫が０のときは−ボタンを押せないようにしました。
- Bootstrap4を用いてわかりやすいデザインを目指しました。
- 削除時に確認メッセージが出るようにしました。
<br /><br />

## 使用技術(開発環境)
#### バックエンド
Ruby, Ruby on Rails

#### フロントエンド
HTML,CSS,JavaScript,Bootstrap4

#### データベース
MySQL SequelPro

#### インフラ
Heroku

#### サーバ（本番環境）
Heroku

#### ソース管理
GitHub, GitHubDesktop

#### テスト
RSpec

#### エディタ
VScode

#### 上記以外の使用Gem
factory_bot_rails
faker
rubocop
rails-i18n
active_hash
devise
<br /><br />

## 課題や今後実装したい機能
- 編集画面をモーダルに変更したい
- 区分で表示を変更する機能を追加したい
<br /><br />

## 画面遷移図
<img src="https://user-images.githubusercontent.com/67131613/95540153-24ab2700-0a2b-11eb-9ab8-7499e2cc190f.png" width="960px">
<br />

## テーブル設計
#### ER図
<img src="https://user-images.githubusercontent.com/67131613/95540146-1f4ddc80-0a2b-11eb-83d6-a7f5730bfa14.png" width="960px">
<br />

#### users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |


###### Association

- has_many :items

#### Items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| stock       | integer    | null: false                    |
| price       | integer    |                                |
| category_id | integer    |                                |
| user        | references | null: false, foreign_key: true |

##### Association

- belongs_to :user

<!-- This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions -->