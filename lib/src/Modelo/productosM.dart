class productosM {
  String nombre = "";
  String precio = "";
  String caracteristicas = "";
  String imagen = "";

  //Constructor

  productosM(this.nombre, this.precio, this.caracteristicas, this.imagen);

  setNombre(nombre) {
    this.nombre = nombre;
  }

  getNombre() {
    return nombre;
  }

  setPrecio(precio) {
    this.precio = precio;
  }

  getPrecio() {
    return precio;
  }

  setcaracteristicas(caracteristicas) {
    this.caracteristicas = caracteristicas;
  }

  getcaracteristicas() {
    return caracteristicas;
  }

  setImagen(imagen) {
    this.imagen = imagen;
  }

  getImagen() {
    return imagen;
  }
}
