## README

### curl + jq コマンド入門講座

[youtube](https://www.youtube.com/watch?v=-HohpQP-lwU)

### 再帰検索
jsonの中にいるはずだが、どの階層にあるのかわからないので、とりあえず見つけたい
```
jq '..|.name?'
```
