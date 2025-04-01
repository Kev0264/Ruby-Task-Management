class Task < ApplicationRecord
    belongs_to :user

    enum :status, { pending: 0, in_progress: 1, completed: 2 }

    scope :due_soon, -> { where(:due_at => Time.current..7.days.from_now) }
    scope :for_user, ->(user) { where(user: user) }

    # Use counter cache for frequent counts
    has_many :comments, counter_cache: true
end
