#!/usr/bin/env pwsh
[CmdletBinding(PositionalBinding = $False)]
param(
    [switch] $Install,
    [switch] $Build,
    [switch] $RebuildDb,
    [switch] $CleanMigrations,
    [string] $AddMigration,
    [switch] $UpdateDb
)

$root = $PSScriptRoot
$db = "llylgamyn"
$web = "$root/src/Llylgamyn.Web"
$infra = "$root/src/Llylgamyn.Infrastructure"
$migrations = "$root/src/Llylgamyn.Infrastructure/Migrations"
$exit_code = 0

try {
    pushd $web

    if ($Install) {
        echo "Install started."

        echo "Installing NuGet packages."
        dotnet restore

        echo "Creating database."
        createdb $db
        dotnet ef database update -s $web -p $infra

        echo "Installing NPM packages."
        npm i

        mkdir wwwroot/css
        mkdir wwwroot/js

        cp -ru "node_modules/bootstrap/dist/js/bootstrap.bundle.js" "wwwroot/js"
    }

    if ($Build) {
        echo "Build started."
        npx node-sass Styles/main.scss wwwroot/css/main.css
        dotnet build
    }

    popd

    if ($RebuildDb) {
        dropdb $db
        createdb $db
    }

    if ($CleanMigrations) {
        rm -rf $migrations
    }

    if ($AddMigration) {
        dotnet ef migrations add $AddMigration -s $web -p $infra
    }

    if ($UpdateDb) {
        dotnet ef database update -s $web -p $infra
    }
}
catch {
    echo $_
    $exit_code = 1
}

exit $exit_code
