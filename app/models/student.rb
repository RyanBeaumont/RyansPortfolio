class Student < ApplicationRecord
    has_one_attached :avatar, dependent: :purge_later
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :major, presence: true
    #validates :student_email, presence: true , uniqueness: true, format: { with: /\A[\w+\-.]+@msudenver\.edu\z/i, message: 'must be a valid email ending with @msudenver.edu' }
    validate :acceptable_image

    VALID_MAJORS=["Computer Engineering BS","Computer Information Systems BS","Computer Science BS","Cybersecurity Major","Data Science and Machine Learning Major"]
    DATE_SEARCH_OPTIONS=["Don't Filter by Date","Graduate Before","Graduate After"]
    validates :major, inclusion:{in: VALID_MAJORS, message:"%{value} is not a valid major"}


    def acceptable_image
        return unless avatar.attached?

        unless avatar.blob.byte_size <= 10.megabyte
            errors.add(:avatar, "File size is too large")
        end

        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(avatar.content_type)
            errors.add(:avatar, "Profile picture is not a .JPEG or .PNG file")
        end
    end
end
