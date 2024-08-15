#*********************************************************************************************
#*********************************************************************************************
# Functions for old_gdp_revisions_datasets.ipynb 
#*********************************************************************************************
#*********************************************************************************************



################################################################################################
# Section 1. Duplicate tables for all other NS ids
################################################################################################


#+++++++++++++++
# LIBRARIES
#+++++++++++++++


# Initial set-up
#...............................................................................................

import os
import tkinter as tk
from tkinter import filedialog


# 
#...............................................................................................



#+++++++++++++++
# Initial set-up
#+++++++++++++++


# Función para solicitar la ruta base de trabajo al usuario
#________________________________________________________________
def set_base_path():
    """
    Abre una ventana de diálogo para que el usuario seleccione el directorio base.
    Si se selecciona un directorio válido, establece el directorio de trabajo inmediatamente.
    """
    # Crear una ventana raíz oculta de Tkinter
    root = tk.Tk()
    root.withdraw()

    # Asegurarse de que la ventana de diálogo se mantenga en primer plano
    root.attributes('-topmost', True)
    root.update()  # Actualiza la ventana para aplicar los atributos

    # Abrir un diálogo de selección de directorio
    base_path = filedialog.askdirectory(title="Seleccione su ruta base para establecer su directorio de trabajo principal")

    # Validar la ruta seleccionada y establecer el directorio de trabajo
    if base_path and os.path.isdir(base_path):
        os.chdir(base_path)
        print(f"Ruta base establecida en: {base_path}")
    else:
        print("La ruta seleccionada no es válida. Por favor, intente de nuevo.")

    # Destruir la ventana raíz después de cerrar el diálogo
    root.destroy()
        

        
#+++++++++++++++
# 2. Limpieza de datos
#+++++++++++++++


# Función para generar las variables clave de los HE
#________________________________________________________________
def create_data_set(pwt_df, year_0, pwt_code, per_capita, per_worker):
    
    year_0 = str(year_0)
    
    if per_capita:
        data = pwt_df[pwt_code]/pwt_df['pop']
        
    elif per_worker:
        data = pwt_df[pwt_code]/pwt_df['emp']
        
    else:
        data = pwt_df[pwt_code]
        
    data = data.unstack(level='country').loc[year_0:].dropna(axis=1)
    
    return data
