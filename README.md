# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル
| Column             | Type    | Options                    |
| ------------------ | ------  | -----------                |
| nickname           | string  | null: false                |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false                |
| last_name          | string  | null: false                |
| first_name         | string  | null: false                |
| last_name_kana     | string  | null: false                |
| first_name_kana    | string  | null: false                |
| birthday           | date    | null: false                |

## アソシエーション
has_many :items
has_many :purchases

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| name               | string     | null: false                    |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| shipping_date_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## アソシエーション
belongs_to :user
has_one :purchase
## ActiveHashを利用する
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :status
belongs_to :delivery_charge
belongs_to :area
belongs_to :shipping_date


## categories テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| id                 | integer    | null: false                    |
| category           | string     | null: false                    |

## アソシエーション
## ActiveHashを利用する
include ActiveHash::Associations
has_many :items

## statuses テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| id                 | integer    | null: false                    |
| status             | string     | null: false                    |

## アソシエーション
## ActiveHashを利用する
include ActiveHash::Associations
has_many :items

## delivery_charges テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| id                 | integer    | null: false                    |
| delivery_charge    | string     | null: false                    |

## アソシエーション
## ActiveHashを利用する
include ActiveHash::Associations
has_many :items

## areas テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| id                 | integer    | null: false                    |
| area               | string     | null: false                    |

## アソシエーション
## ActiveHashを利用する
include ActiveHash::Associations
has_many :items
has_many :address

## shipping_dates テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| id                 | integer    | null: false                    |
| shipping_date      | string     | null: false                    |

## アソシエーション
## ActiveHashを利用する
include ActiveHash::Associations
has_many :items

## purchases テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

## アソシエーション
belongs_to :item
belongs_to :user
has_one :address

## addresses テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| postal_code        | string     | null: false                    |
| area_id            | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |

## アソシエーション
belongs_to :purchase
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :area