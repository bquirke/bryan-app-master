class Photo < ActiveRecord::Base

  validates :title,  presence: true, length: { maximum: 50 }

	has_attached_file :image,
              path: ":rails_root/public:url",
              url: "/system/:class/:attachment/:id_partition/:style/:hash.:extension",
              hash_secret: 'ff316a9b0520de940a78ea922a7eae2a54f40e1b855af9d4338854ddff6cacc4261fccbe47427463aad642e964d9ab46d74db34907e66fa0f14f18a06c599a52'

	validates_attachment :image,
              presence: true,
              content_type: { content_type: ["application/pdf",
                     "application/vnd.ms-excel",     
                     "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                     "application/msword", 
                     "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
                     "text/plain"] },
              size: { less_than: 2.megabytes }
end
