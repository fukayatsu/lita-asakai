# lita-asakai

Daily Standup Facilitator

## Installation

Add lita-asakai to your Lita instance's Gemfile:

``` ruby
gem "lita-asakai"
```

## Configuration

Nothing

## Usage

```
> @bot asakai @foo @bar @baz
BOT > 順番は @baz =>  @foo => @bar => @foo (今日のひとこと)
BOT > じゃあ @baz から、「前回やったこと」/「今日やること」/「気になってること」
baz > ほげほげ
baz > @bot next
BOT > 次は @foo やで
foo > ほげ
foo > @bot 次
BOT > 次は @bar やで
bar > ほげほげほげ
bar > @bot next
BOT > @foo 今日のひとこと:
foo > ほげほげ
```
