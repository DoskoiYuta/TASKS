class Task < ApplicationRecord
  
  #データ検証(nameにデータが入っているか、30文字より小さいか、カンマを含んでいないか)
  validates :name,presence: true,length: {maximum: 30}
  validate :validate_name_not_including_comma

  belongs_to :user  #ある一つのuserモデルと関連づいてるよってこと

  scope :recent, -> { order(created_at: :desc)} #recentというメソッドでブロック内の条件でディスクの絞り込みができるようになる

  private
  def validate_name_not_including_comma
    errors.add(:name,"にカンマを含めることはできません。") if name&.include?(",")
  end

end
