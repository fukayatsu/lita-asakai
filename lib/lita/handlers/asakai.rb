module Lita
  module Handlers
    class Asakai < Handler
      # insert handler code here
      route /^asakai\s+(@.+)$/, :start, command: true, help: {
        "@bot asakai @foo @bar @baz" => "Start ASAKAI for @foo @bar @baz"
      }

      route /^next|次$/, :next_member, command: true, help: {
        '@bot next' => "Mention to next person"
      }

      def start(response)
        members = response.matches.flatten.first.scan(/@\S+/).shuffle
        members << members.sample # for wrap up

        redis.del 'members'
        redis.rpush 'members', members[1..-1]
        response.reply "順番は #{members.join(' => ')} (今日のひとこと)"
        response.reply "じゃあ #{members.first} から、前回やったこと」/「今日やること」/「気になってること」"
      end

      def next_member(response)
        return if redis.llen('members').zero?
        next_member = redis.lpop 'members'
        if redis.llen('members').zero?
          response.reply "#{next_member} 今日のひとこと:"
        else
          response.reply "次は #{next_member} やで"
        end
      end

      Lita.register_handler(self)
    end
  end
end
