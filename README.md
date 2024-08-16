# Análisis Exploratorio del Programa de Bicicletas Compartidas Citi Bike

Este proyecto se enfoca en realizar un análisis exploratorio del programa de bicicletas compartidas Citi Bike. A través de este análisis, buscamos entender los patrones de uso, identificar tendencias históricas y proporcionar recomendaciones para la toma de decisiones estratégicas.

![alt text](images/logo.png)

## Objetivos
1. **Métricas de uso en un día promedio**
    - Número promedio de viajes diarios: Determinar cuántos viajes se realizan en un día promedio.
    - Estadísticas descriptivas de la duración de los viajes: Calcular el valor máximo, mínimo, promedio, y la desviación estándar de la duración de los viajes en minutos.
2. **Métricas históricas del servicio**
    - Total de viajes: Calcular el número total de viajes realizados durante el periodo de análisis.
    - Crecimiento del número de viajes diarios: Analizar cómo ha cambiado el número de viajes diarios a lo largo del tiempo.
    - Desglose de viajes por perfil de usuario: Desglosar los viajes por género, edad y tipo de suscripción para identificar patrones de uso.
3. **Descubrimiento de patrones y tendencias**
    - Patrones de uso: Identificar patrones en el uso del servicio según el día de la semana, la duración del viaje y el perfil del usuario.
    - Tendencias históricas: Detectar tendencias en el número de viajes a lo largo del tiempo, observando aumentos o disminuciones.
4. **Recomendaciones Estratégicas**
    - Recomendaciones para optimización: Basado en los hallazgos, ofrecer sugerencias que puedan mejorar la eficiencia del servicio, aumentar la satisfacción del usuario y promover una mayor participación.

## Preparación de Datos

1. **Revisión de nulos**

Durante la revisión de valores nulos en el dataset citi_bike_trips, se identificaron nulos en las siguientes variables:

   - **birth_year:** 4,639 valores nulos.
   - **null_customer_plan:** 50,000 valores nulos.

1.1 **Decisiones Tomadas**

   - null_customer_plan: Los valores nulos en esta variable se mantienen,existe la posibilidad de que haya ocurrido un error en la recolección o el procesamiento de los datos, dejando esta variable vacía.
   - birth_year: Se decidió eliminar los registros con valores nulos en esta variable (4,639 registros) para realizar un análisis más detallado y preciso. Esta decisión permite centrarse en usuarios con información completa, lo que facilita la segmentación por edad y la generación de insights demográficos más robustos.

