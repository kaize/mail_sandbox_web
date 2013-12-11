class GithubType < User::Github
  include ApplicationType

  permit :uid
end