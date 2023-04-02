class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  

  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validate :date_check

  def date_check
    return if checkin_date.blank? || checkout_date.blank?
    errors.add(:checkout_date, "(チェックアウト)はチェックイン以降の日付を選択してください" )if checkout_date < checkin_date
  end
end
