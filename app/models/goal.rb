class Goal < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :end_money, presence: true, numericality: { only_float: true }
  validates :start_money, presence: true, numericality: { only_float: true }
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :valid_duration
  validate :valid_money, on: :create

  def valid_duration
    if end_at.present? && start_at.present? && (end_at - start_at).to_i < 0
      errors.add(:end_at, 'значение не может быть меньше начального')
    end
  end

  def valid_money
    if start_money.present? && end_money.present? && (start_money - end_money) > 0
      errors.add(:end_money, 'значение не может быть меньше начального')
    end
  end

  def start_at_goal
    return if start_at.blank?
    start_at.strftime('%m/%d/%Y')
  end

  def start_at_goal=(value)
    return self.start_at = nil if value.blank?
    self.start_at = Date.strptime(value, '%m/%d/%Y')
  end

  def end_at_goal
    return if end_at.blank?
    end_at.strftime('%m/%d/%Y')
  end

  def end_at_goal=(value)
    return self.end_at = nil if value.blank?
    self.end_at = Date.strptime(value, '%m/%d/%Y')
  end
end
