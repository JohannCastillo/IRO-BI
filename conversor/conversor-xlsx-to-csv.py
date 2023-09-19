# import pandas as pd

# data_xls = pd.read_excel('excelfile.xlsx', 'Hoja1', index_col=None)
# data_xls.to_csv('csvfile.csv', encoding='utf-8', index=False)

import pandas as pd

filePath = './Ubigeos/Provincias.xlsx'

xls = pd.ExcelFile(filePath)

for sheet_name in xls.sheet_names:
    data_xls = pd.read_excel(filePath, sheet_name, index_col=None)
    csv_filename = f'{sheet_name}.csv'
    data_xls.to_csv(csv_filename, encoding='utf-8', index=False)

xls.close()