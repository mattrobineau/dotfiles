[Environment]::SetEnvironmentVariable(
    "XDG_CONFIG_HOME",
    $HOME + "\.config\",
    [System.EnvironmentVariableTarget]::User
)
