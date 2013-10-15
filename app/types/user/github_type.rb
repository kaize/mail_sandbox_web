class GithubType < User::Github
  include BaseType

  permit :uid
end