open ReactNative

type person = {
  name: string,
  friends: array<string>,
  age: int,
}
@module("MySchool") external john: person = "john"

type ellipsizeMode = [#clip | #head]

@react.component
let make = (
  ~value="default",
  ~mode1: option<ellipsizeMode>=?,
  ~mode2: option<ellipsizeMode>=?,
  ~mode3: option<ellipsizeMode>=?,
) => {
  <View>
    <Text>
      {value->React.string}
      {switch mode1 {
      | None => React.string("none")
      | Some(#clip) => React.string("clip")
      | Some(#head) => React.string("head")
      }}
      {john.name->React.string}
    </Text>
  </View>
}
