#!/usr/bin/python3
from flask import Flask, request, jsonify
import cx_Oracle

app = Flask(__name__)

# Configura la conexión a la base de datos Oracle
def conectar_oracle():
    # Aquí debes colocar tus credenciales de Oracle
    user = 'proyecto'
    password = '12345'
    host = 'localhost'
    sid = 'xe'
    dsn_tns = cx_Oracle.makedsn(host, 1521, sid)
    conexion = cx_Oracle.connect(user=user, password=password, dsn=dsn_tns)
    return conexion

# Función para determinar si una consulta es de selección o no
def es_consulta_select(query):
    # Convertir la consulta a minúsculas para facilitar la comparación
    query = query.strip().lower()
    return query.startswith("select")

# Función para ejecutar el query y obtener resultados
def ejecutar_query(query):
    try:
        # Conecta con la base de datos Oracle
        conexion = conectar_oracle()
        cursor = conexion.cursor()
        
        # Verifica si la consulta es un SELECT
        if es_consulta_select(query):
            # Ejecuta el query de selección
            cursor.execute(query)
            # Obtiene los resultados
            rows = cursor.fetchall()
            # Convierte los resultados a una lista de diccionarios para JSON
            results = []
            for row in rows:
                result_dict = {}
                for i, col in enumerate(cursor.description):
                    result_dict[col[0]] = row[i]
                results.append(result_dict)
        else:
            # Si no es un SELECT, ejecuta la consulta directamente
            cursor.execute(query)
            # Realiza un commit para aplicar los cambios
            conexion.commit()
            results = {'message': 'Operación ejecutada exitosamente.'}
        
        # Cierra el cursor y la conexión
        cursor.close()
        conexion.close()
        
        return results
    
    except Exception as e:
        return {'error': str(e)}

# Ruta para recibir el query y devolver el resultado en JSON
@app.route('/consultar_oracle', methods=['GET', 'POST'])
def consultar_oracle():
    if request.method == 'GET':
        # Si la solicitud es GET, obtiene el query de los parámetros de la URL
        query = request.args.get('query')
    elif request.method == 'POST':
        # Si la solicitud es POST, obtiene el query desde el cuerpo del request
        data = request.get_json()
        query = data['query']
    else:
        return jsonify({'error': 'Método no permitido'}), 405
    
    # Ejecuta el query y obtiene los resultados
    results = ejecutar_query(query)
    
    # Imprime los resultados en la terminal
    print(results)
    
    # Retorna los resultados en formato JSON
    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True)
