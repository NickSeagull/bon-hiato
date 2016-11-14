module Common.Model where

type Model =
  {}

type Project =
  { productBacklog:: ProductBacklog
  , sprints:: Array Sprint
  , team:: Team
  , riskManager:: RiskManager
  , statisticsReport:: Array StatisticsReport
  }

type ProductBacklog =
  { userStory:: UserStory
  }

type Sprint =
  { userStories:: Array UserStory
  , burndownChart:: BurndownChart
  }

type UserStory =
  { userStoryType:: UserStoryType
  , code:: String
  , description:: String
  , points:: Int
  , priority:: Int
  }

data UserStoryType
  = Pending
  | Finished
  | InProgress
  | Blocked String

type Team =
  { productOwner:: Member
  , scrumMaster:: Member
  , developer:: Array Member
  }

data Member
  = Developer String
  | ProductOwner String
  | ScrumMaster String

data StatisticsReport
  = StatisticsChart

type StatisticsChart =
  { burndownChart:: BurndownChart
  , loggedTimeChart:: LoggedTimeChart
  }

type BurndownChart =
  { sprintAchievements:: Array Achievement
  }

type Achievement =
  { daysSpent:: Int
  , points:: Int
  }

type LoggedTimeChart =
  { hoursLogged:: Array Int
  }

type RiskManager = {}
