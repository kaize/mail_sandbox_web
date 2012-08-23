FactoryGirl.define do
  sequence :facebook_auth do
    {
      :provider => 'facebook',
      :uid => '1234567',
      :info => {
        :nickname => 'jbloggs',
        :email => 'joe@bloggs.com',
        :name => 'Joe Bloggs',
        :first_name => 'Joe',
        :last_name => 'Bloggs',
        :image => 'http://graph.facebook.com/1234567/picture?type=square',
        :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
        :location => 'Palo Alto, California',
        :verified => true
      },
      :credentials => {
        :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
        :expires_at => 1321747205, # when the access token expires (it always will)
        :expires => true # this will always be true
      },
      :extra => {
        :raw_info => {
          :id => '1234561',
          :name => 'Joe Bloggs',
          :first_name => 'Joe',
          :last_name => 'Bloggs',
          :link => 'http://www.facebook.com/jbloggs',
          :username => 'jbloggs',
          :location => { :id => '123456789', :name => 'Palo Alto, California' },
          :gender => 'male',
          :email => 'joe@bloggs.com',
          :timezone => -8,
          :locale => 'en_US',
          :verified => true,
          :updated_time => '2011-11-11T06:21:03+0000'
        }
      }
    }
  end

  sequence :github_auth do
    {
      :provider=>"github",
      :uid=>'123452',
      :info=>{
        :nickname=>"user_login",
        :email=>"user_login@example.com",
        :name=>"User Name",
        :image=>"https://secure.gravatar.com/avatar/e12c872b9ba9909b6645c0e855fcba28?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png",
        :urls=>{
          "GitHub"=>"https://github.com/user_login",
          "Blog"=>nil
        }
      }, 
      :credentials=>{
        :token=>"0123456789qwertyuiopasdfghjklzxcvbnm0123",
        :expires=>false
      }, 
      :extra=>{
        :raw_info=>{
          :type=>"User",
          :avatar_url=>"https://example.com",
          :public_repos=>25,
          :total_private_repos=>9,
          :disk_usage=>12345,
          :html_url=>"https://github.com/user",
          :following=>8,
          :blog=>nil,
          :location=>"Ulyanovsk",
          :owned_private_repos=>0,
          :collaborators=>0,
          :created_at=>"2010-11-25T16:33:28Z",
          :company=>"Undev",
          :gravatar_id=>"e12c872b9ba9909b6645c0e855fcba28",
          :login=>"user_login",
          :plan=>{
            :space=>307200,
            :collaborators=>0,
            :name=>"free",
            :private_repos=>0
          },
          :public_gists=>9,
          :private_gists=>2,
          :email=>nil,
          :name=>"User Name",
          :hireable=>false,
          :url=>"https://api.github.com/users/user_login",
          :id=>123456,
          :followers=>8,
          :bio=>nil
        }
      }
    }
  end
end
