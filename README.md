# vn-sync

## Run

## Prerequisite

Create `config.json`  

```json
{
    "from": [
        "C:\\Users\\User\\AppData\\Roaming\\maker1",
        "C:\\Users\\User\\AppData\\Roaming\\maker2"
    ],
    "to": "D:\\backup"
}
```

### Backup

Backup `from` folders to `to`  

```sh
./vn-sync.ps1 b
```

### Restore

Restore `to` folders to `from`

```sh
./vn-sync.ps1 r
```
