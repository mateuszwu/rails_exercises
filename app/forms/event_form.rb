class EventForm < Patterns::Form
  param_key 'event'

  attribute :registration_type, String
  attribute :admin_can_create_teams, Boolean

  attribute :individual_description, String
  attribute :group_description, String
  attribute :team_description, String

  attribute :max_peoples, Integer
  attribute :max_people_in_group, Integer
  attribute :max_people_in_team, Integer
  attribute :max_teams, Integer

  validates :registration_type, inclusion: { in: ['individual', 'group', 'team'] }

  validates :individual_description, presence: true
  validates :max_peoples, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :group_description, presence: true, if: -> { groups_enabled? || teams_enabled? }
  validates :max_people_in_group,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 },
            if: -> { groups_enabled? || teams_enabled? || admin_can_create_teams }

  validates :team_description, presence: true, if: -> { teams_enabled? }
  validates :max_people_in_team, :max_teams,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 },
            if: -> { teams_enabled? || admin_can_create_teams }

  private

  def persist
    true
  end

  def groups_enabled?
    registration_type == 'group'
  end

  def teams_enabled?
    registration_type == 'teams'
  end
end