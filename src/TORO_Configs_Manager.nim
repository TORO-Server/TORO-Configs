import asyncdispatch, os, strutils, sequtils, std/strformat, re

import secrets


# 置換ルール 生成
let replace_rule* = ENV_KEYS.map(proc(key: string): (string, string) =
  (fmt"[[{key}]]", getEnv(key, ""))
)


## 非同期でファイル 処理
proc processFile(filePath: string, rep_rule: seq[(string, string)]) {.async.} =
  let (dirPath, fileName) = splitPath(filePath)
  if ($fileName).contains(re(r"\.pub\.*")):
    try:
      # ファイル 読み込み
      var content = readFile($filePath)
      # ファイル内容 置換
      content = content.multiReplace(rep_rule)
      # 新しいファイル名(".pub" を削除) 生成
      let newFilename = filename.replace(re(r"\.pub\.*"), "")
      let newFilePath = dirPath / newFilename
      # 置換後のファイル内容 書き込み
      writeFile(newFilePath, content)

      echo fmt"(OK) {filePath} -> {newFilePath}"
    except IOError as e:
      echo fmt"(ERROR) [IOError] {e.msg}"
    except Exception as e:
      echo fmt"(ERROR) [Exception] {e.msg}"


## メイン 非同期処理
proc main() {.async.} =
  var tasks: seq[Future[void]]

  # カレントディレクトリ 探索(再帰的)
  for filePath in walkDirRec(getCurrentDir()):
    # ファイル毎に非同期処理タスクを生成してリストに追加
    tasks.add processFile($filePath, replace_rule)

  # すべてのタスクが完了するまで 待機
  await all(tasks)

when isMainModule:
  waitFor main()
