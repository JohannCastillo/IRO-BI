import os
import pandas as pd

#Ruta del archivo a convertir 
filePath = 'D:\\UNT\\CICLO VIII\\Inteligencia de Negocios\\Proyecto IRO\\IRO-BI\\conversor\\Distritos.xlsx'


output = os.path.join(os.getcwd(), 'conversor','data')

if not os.path.exists(output):
    os.makedirs(output)

xls = pd.ExcelFile(filePath)

for sheet_name in xls.sheet_names:
    data_xls = pd.read_excel(filePath, sheet_name, index_col=None)
    csv_filename = os.path.join(output, f'{sheet_name}.csv')
    data_xls.to_csv(csv_filename, encoding='utf-8', index=False, sep='|')

xls.close()