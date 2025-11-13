import streamlit as st

st.title("Ejemplo con Streamlit")
st.write("Pulsa el botón para saludar")

if st.button("Saludar"):
    st.success("¡Hola mundo con Streamlit!")
