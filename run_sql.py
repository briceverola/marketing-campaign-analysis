import duckdb

conn = duckdb.connect('~/Documents/sql_project/marketing.duckdb')

files = ['1_staging.sql', '2_kpi_models.sql', '3_export.sql']

for file in files:
    print(f"Running {file}...")
    with open(file, 'r') as f:
        conn.execute(f.read())
    print(f"✓ {file} done")

print("\nAll done! Check your exports folder.")