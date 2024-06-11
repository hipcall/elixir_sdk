# HipcallSDK

Official Hipcall API Wrapper written in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `hipcall_sdk` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:hipcall_sdk, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/hipcall_sdk>.

## Configuration override

Client library configuration can be overwritten in runtime by passing a %HipcallSdk.Config{} 
struct as last argument of the function you need to use. For instance if you need to use a different 
api_key you can simply do:

```elixir
config_override = %HipcallSdk.Config{
  api_key: "mTRwVrbZ4aoHTyjMepleT3BlbkFJ7zZYazuN7F16XuY3WErl",
  api_url: "https://use.hipcall.com.tr/api/v3"
}
# pass the overriden configuration as last argument of the function
HipcallSdk.models(config_override)
```

## Use

Documentation for using, please check the `HipcallSdk` module.

## Roadmap

- [ ] Task
- [ ] Phone system - call
- [ ] Phone system - extensions
- [ ] Phone system - greetings
- [ ] Phone system - numbers
- [ ] Phone system - teams
- [ ] Phone system - users
- [ ] Phone system - voicemails
- [ ] Contact centre
- [ ] Sales 
- [ ] Account

## Hipcall

All [Hipcall](https://www.hipcall.com/en-gb/) libraries:

- [HipcallDisposableEmail](https://github.com/hipcall/hipcall_disposable_email) - Simple library checking the email's domain is disposable or not.
- [HipcallDeepgram](https://github.com/hipcall/hipcall_deepgram) - Unofficial Deepgram API Wrapper written in Elixir.
- [HipcallOpenai](https://github.com/hipcall/hipcall_openai) - Unofficial OpenAI API Wrapper written in Elixir.
- [HipcallWhichtech](https://github.com/hipcall/hipcall_whichtech) - Find out what the website is built with.
- [HipcallSDk](https://github.com/hipcall/elixir_sdk) - Official Hipcall API Wrapper written in Elixir.