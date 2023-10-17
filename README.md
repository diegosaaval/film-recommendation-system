# RESUMEN INFORME CASO DE ESTUDIO SOBRE SISTEMA DE RECOMENDACIÓN DE PELÍCULAS 
* DIEGO ALEJANDRO SAAVEDRA VALDIVIESO
* NILSON SUAREZ HERNANDEZ
* DAYAN EDUARDO MARÍN QUINTERO

---------------------------------------------------
<p align="center">
MATERIA: APLICACIONES DE LA ANALÍTICA
<p align="center">
PROFESOR: JUAN CAMILO ESPAÑA LOPERA
<p align="center">
INGENIERÍA INDUSTRIAL
<p align="center">
FACULTAD DE INGENIERÍA 
<p align="center">
UNIVERSIDAD DE ANTIOQUIA
<p align="center">
2023

## Descripción del problema de negocio
En la actualidad, la industria del entretenimiento se enfrenta a un desafío crucial: cómo ofrecer a los usuarios una experiencia de streaming personalizada y atractiva en medio de una abrumadora cantidad de contenido disponible. Esto es especialmente cierto en un mundo en el que la competencia es feroz y los consumidores esperan una oferta de entretenimiento a la carta que se adapte a sus gustos individuales.
## Problema central
La sobrecarga de elección es una preocupación común en la era del streaming, donde los usuarios se ven abrumados por la exagerada cantidad de contenido disponible. Esta situación puede llevar a la indecisión y provocar la pérdida de interés por parte de los usuarios. Esto no satisface las necesidades individuales de los usuarios y limita su compromiso con la plataforma.
## Solución propuesta
Nuestra solución se basa en modelos de filtro colaborativo para recomendaciones personalizadas, un filtro de popularidad para contenido relevante y un filtro individual (KNN) al terminar una película para sugerencias precisas. Estos enfoques se combinan para brindar una experiencia de visualización equilibrada y agradable en nuestra plataforma de streaming.
## Beneficios esperados
Nuestros objetivos incluyen mejorar la retención de usuarios y reducir la rotación de suscriptores al proporcionar contenido altamente personalizado y relevante. Asimismo, buscamos aumentar la satisfacción del cliente a través de recomendaciones de alta calidad, lo que fomentará opiniones positivas y la lealtad a nuestra plataforma y así destacarnos en el competitivo mercado de streaming, fortaleciendo nuestra posición en la industria.
## Diseño de solución propuesto
El despliegue de nuestro sistema de recomendación que combina modelos de filtro
colaborativo, filtros basados en popularidad y filtro basado en un producto es una parte
crucial de la implementación de nuestra aplicación de streaming estilo Netflix. Aquí están los
pasos clave para el diseño de la solución:
1. Extracción de datos: Diariamente, se ejecuta un proceso automatizado que extrae
datos de películas de la base de datos SQL para el filtro de popularidad.
Semanalmente, se realiza otra extracción de datos para el filtro colaborativo,
capturando las interacciones y calificaciones de los usuarios durante la semana.
2. Transformación de datos: Los datos extraídos se someten a un proceso de
transformación mediante scripts SQL predefinidos que aplican funciones específicas.
Estas funciones pueden incluir normalización de calificaciones, cálculo de puntajes de
popularidad y otros ajustes necesarios.
3. Generación de tops y filtro basado en un solo producto: Los resultados de la
transformación se utilizan para generar diferentes tops de películas basados en
popularidad, como el TOP 10 mejor calificadas y con más calificaciones. Estos tops
se actualizan diaria o semanalmente, según corresponda. Estos serán usados en
conjunto con el filtro basado en un solo producto en pestañas y al final de las
películas, también serán de utilidad para usuarios nuevos
4. Interfaz de usuario: En la pantalla principal de la aplicación, se muestra un carrusel horizontal con los tops generados, lo que permite a los usuarios ver títulos y calificaciones. Otra pestaña permite a los usuarios buscar y explorar las mejores películas calificadas por año y género, brindando una experiencia interactiva.
5. Filtro colaborativo: En la pestaña "PARA TI", se presenta el filtro colaborativo, que recomienda películas en función de las calificaciones pasadas del usuario. Si el usuario no ha visto ninguna película en la plataforma, se le muestra el filtro de popularidad inicialmente para que el algoritmo pueda aprender sus preferencias con el tiempo.

## Conclusiones
* Se logra la creación de un filtro basado en popularidad muy útil para el usuario nuevo y con más tiempo en la plataforma, conociendo lo mejor calificado y con más calificaciones en general, por año y por género
* Se logra la creación de un de filtro colaborativo para el usuario con más tiempo en la plataforma con un error de +/- 0.5 en la calificación final
* Se logra la creación de un filtro basado en un solo producto (KNN) para el usuario nuevo y con más tiempo en la plataforma para que lo visualice al finalizar la película
* Se logra la creación de otros filtros como los basados en todo el contenido para implementar en un futuro ya que no forman parte de la solución final
## Recomendaciones
* Crear apartados adicionales como: director, vistas totales, país de publicación, temática o argumento, duración total de la película, premios y clasificación por edad para obtener mejores resultados en las predicciones
* Implementar el despliegue y el monitoreo.
* Implementar métricas de la satisfacción del cliente para evaluar el impacto de los algoritmos y las predicciones

## Informe Completo
https://github.com/diegosaaval/film-recommendation-system/blob/main/INFORME_FINAL.pdf