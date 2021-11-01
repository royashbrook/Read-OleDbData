function Read-OleDbData([string]$ConnectionString,[string]$SqlStatement){
    $DataTable = new-object System.Data.DataTable
    $DataAdapter = new-object System.Data.OleDb.OleDbDataAdapter $SqlStatement,$ConnectionString
    $null = $DataAdapter.Fill($DataTable)
    $null = $DataAdapter.Dispose()
    $DataTable.Rows | Select-Object $DataTable.Columns.ColumnName
}
Export-ModuleMember -Function Read-OleDbData