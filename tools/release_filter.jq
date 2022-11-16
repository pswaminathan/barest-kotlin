def release_uri:
  select(.id.targetCompleted.label == "//android/app:app")
    | select(.completed.success)
    | .completed.importantOutput[]
    | select(.name == "android/app/app_unsigned.apk")
    | .uri
;
