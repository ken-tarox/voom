class Onsenpost < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :onsen_name, presence: true, length: { maximum: 100 }
  validates :prefecture, presence: true
  validates :address, presence: true
  validate  :picture_size
  geocoded_by :address
  after_validation :geocode

  scope :search, -> (search_params) do
    return if search_params.blank?
    onsen_name_like(search_params[:onsen_name])
      .kind_is(search_params[:kind])
      .kind_b_is(search_params[:kind_b])
      .kind_c_is(search_params[:kind_c])
      .kind_d_is(search_params[:kind_d])
      .prefecture_is(search_params[:prefecture])
  end

  scope :onsen_name_like, -> (onsen_name) { where('onsen_name LIKE ?', "%#{onsen_name}%") if onsen_name.present? }
  scope :kind_is, -> (kind) { where(kind: kind) if kind.present? }
  scope :kind_b_is, -> (kind_b) { where(kind_b: kind_b) if kind_b.present? }
  scope :kind_c_is, -> (kind_c) { where(kind_c: kind_c) if kind_c.present? }
  scope :kind_d_is, -> (kind_d) { where(kind_d: kind_d) if kind_d.present? }
  scope :prefecture_is, -> (prefecture) { where(prefecture: prefecture) if prefecture.present? }

  enum prefecture:{
     #{}"未選択":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
   }

   enum kind:{
      自噴:1,掛け流し:2,泉源１００％:3,極上泉質:4,泉質良好:5
    }

    enum kind_b:{
       露天:1,足湯:2,炭酸泉:3,サウナ:4,ミストサウナ:5,岩盤浴:6,貸切風呂:7,家族風呂:8
     }

     enum kind_c:{
        庶民的:1,古い:2,ラグジュアリー:3,リゾート:4,自然を満喫:5,景観良好:6
      }

      enum kind_d:{
         ファミリー向け:1,女性向け:2,秘湯:3,温泉マニア向け:4,早朝営業:5,深夜営業:6
       }

  def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
  end

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def rating_average
    if self.comments.blank?
      rating_average = 0
    elsif self.comments.average(:rate).nil?
      @average_rate = 0
    else
     self.comments.average(:rate).round(1)
    end
  end
end
