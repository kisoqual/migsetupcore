$migVarName;
$choice = Read-Host "Установить EntityFramework перед миграцией? (Y/N)";

if ($choice -eq "y") {
    dotnet add package Microsoft.EntityFrameworkCore;
    Menu;
}
if ($choice -eq "n") { Menu; }
else {
    Write-Output "Неверный ввод!";
    $choice = Read-Host "Установить EntityFramework перед миграцией? (Y/N)";
}
    
function Menu {
    Write-Output "`n----Мастер миграции Code First в EF Core----";
    Write-Output "1. Добавление миграции`n2. Выйти";
    $choice = Read-Host;
    if ($choice -eq "1") {
        AddMigration($migVarName);
        Pause;
        exit;
    }
    if ($choice -eq "2") {
        Pause;
        exit;
    }
    else {
        Clear-Host;
        Write-Output "Неверный ввод!";
        Menu;
    }
}  

function AddMigration {
    param ($migInnerVarName)
    $migInnerVarName = Read-Host "Введите имя переменной для миграции: ";
    dotnet ef migrations add $migInnerVarName;
    dotnet ef database update;
}

if ($choice -eq "y") {
    dotnet tool install --global dotnet-ef;
    $choice = Read-Host "Установить EntityFramework.Design перед миграцией? (Y/N)";
    if ($choice -eq "y") {
        dotnet add package Microsoft.EntityFrameworkCore.Design;
        Menu;
    }
    else { Menu; }
}
else { Menu; }
