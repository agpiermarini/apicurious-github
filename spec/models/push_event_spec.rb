require 'rails_helper'

describe PushEvent do
  subject { PushEvent.new(
    {:type=>"PushEvent",
     :repo=>{:id=>132697165, :name=>"agpiermarini/apicurious-github", :url=>"https://api.github.com/repos/agpiermarini/apicurious-github"},
     :payload=>
      {:commits=>
        [{:sha=>"ecca1876586187db0cc0d4033b2b6c1107438fa7", :author=>{:email=>"piermarini.andrew@gmail.com", :name=>"agpiermarini"}, :message=>"Add github starred api endpoint", :distinct=>false, :url=>"https://api.github.com/repos/agpiermarini/apicurious-github/commits/ecca1876586187db0cc0d4033b2b6c1107438fa7"},
         {:sha=>"6e95aabafeac1900ecb3b1e8a77c38ee2ad9df12", :author=>{:email=>"piermarini.andrew@gmail.com", :name=>"agpiermarini"}, :message=>"Add starred search class", :distinct=>false, :url=>"https://api.github.com/repos/agpiermarini/apicurious-github/commits/6e95aabafeac1900ecb3b1e8a77c38ee2ad9df12"},
         {:sha=>"77a65f8cfa3517364c6e68e79f88f4d83cc90e05",
          :author=>{:email=>"piermarini.andrew@gmail.com", :name=>"agpiermarini"},
          :message=>"Refactor starred count. Updated views with endpoint. Add starred_count method to profile class, update view to display starred_count",
          :distinct=>false,
          :url=>"https://api.github.com/repos/agpiermarini/apicurious-github/commits/77a65f8cfa3517364c6e68e79f88f4d83cc90e05"},
         {:sha=>"0dee4a9fad6fce53ccf22c6e6d1dcf2aaf4afe5c", :author=>{:email=>"piermarini.andrew@gmail.com", :name=>"agpiermarini"}, :message=>"Sort starred repos by updated", :distinct=>false, :url=>"https://api.github.com/repos/agpiermarini/apicurious-github/commits/0dee4a9fad6fce53ccf22c6e6d1dcf2aaf4afe5c"},
         {:sha=>"69cc8c60da8af88ab41714f425424a15eee76502", :author=>{:email=>"piermarini.andrew@gmail.com", :name=>"agpiermarini"}, :message=>"Sort starred repos by updated", :distinct=>false, :url=>"https://api.github.com/repos/agpiermarini/apicurious-github/commits/69cc8c60da8af88ab41714f425424a15eee76502"},
         {:sha=>"cc41bf7199be08cb34606cb8eb76553da0020762", :author=>{:email=>"piermarini.andrew@gmail.com", :name=>"agpiermarini"}, :message=>"Update styling. Add tests for invalid endpoints", :distinct=>false, :url=>"https://api.github.com/repos/agpiermarini/apicurious-github/commits/cc41bf7199be08cb34606cb8eb76553da0020762"},
         {:sha=>"c99a29d9d011eb8039943d7f80877392297aa278",
          :author=>{:email=>"agpiermarini@users.noreply.github.com", :name=>"Andrew Piermarini"},
          :message=>"Merge pull request #7 from agpiermarini/github-starred-endpoinnt\n\nGitHub starred endpoinnt",
          :distinct=>true,
          :url=>"https://api.github.com/repos/agpiermarini/apicurious-github/commits/c99a29d9d011eb8039943d7f80877392297aa278"}]},
     :created_at=>"2018-05-11T04:17:39Z"})
   }
  context 'initialize' do
    it 'initializes with hash of attributes' do
      expect(subject).to be_a PushEvent
    end
  end

  context 'instance methods' do
    it '#repo_name' do
      expect(subject.repo_name).to eq("apicurious-github")
    end

    it '#commits' do
      expect(subject.commits).to be_an Array
      expect(subject.commits.first).to be_a Commit
    end
  end
end
