module Common.Model exposing (..)

type alias Model =
  {}

type alias Project =
  { productBacklog: ProductBacklog
  , sprints: List Sprint
  , team: Team
  , riskManager: RiskManager
  , statisticsReport: List StatisticsReport
  }

type alias ProductBacklog =
  { userStory: UserStory
  }

type alias Sprint =
  { userStories: List UserStory
  , burndownChart: BurndownChart
  }

type alias UserStory =
  { userStoryType: UserStoryType
  , code: String
  , description: String
  , points: Int
  , priority: Int
  }

type UserStoryType
  = Pending
  | Finished
  | InProgress
  | Blocked String

type alias Team =
  { productOwner: Member
  , scrumMaster: Member
  , developer: List Member
  }

type Member
  = Developer String
  | ProductOwner String
  | ScrumMaster String

type alias StatisticsReport
  = StatisticsChart

type alias StatisticsChart =
  { burndownChart: BurndownChart
  , loggedTimeChart: LoggedTimeChart
  }

type alias BurndownChart =
  { sprintAchievements: List Achievement
  }

type alias Achievement =
  { daysSpent: Int
  , points: Int
  }

type alias LoggedTimeChart =
  { hoursLogged: List Int
  }

type alias RiskManager = {}
