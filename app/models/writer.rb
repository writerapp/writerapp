class Writer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { 男: 0, 女: 1, その他: 2}, _suffix: true
  # enum表記方法は、上記と下記どちらでも同じ
  enum occupation: [:会社員, :フリーター, :専業主婦または主夫, :その他], _suffix: true
  enum experience_year: [:未経験, :一年未満, :一年以上]
  enum status: [:トライアル, :契約済み, :アカウント停止]

  validates :last_name, presence: { message: "苗字を入力してください" }
  validates :first_name, presence: { message: "名前を入力してください" }
  validates :last_name_kana, presence: { message: "カナ苗字を入力してください" }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナで入力して下さい'}
  validates :first_name_kana, presence: { message: "カナ名前を入力してください" }, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'は全角カタカナで入力して下さい'}
  validates :sex, presence: { message: "性別を選択してください" }
  validates :birthdate, presence: { message: "生年月日を入力してください" }
  validates :occupation, presence: { message: "職業を選択してください" }
  validates :experience_year, presence: { message: "ライター経験年数を選択してください" }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'は半角英数字で入力して下さい'}
end
