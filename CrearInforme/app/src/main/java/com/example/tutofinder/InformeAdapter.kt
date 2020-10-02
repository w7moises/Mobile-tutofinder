package com.example.tutofinder

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.prototype_informe.view.*

class InformeAdapter(var informes: ArrayList<Informe>): RecyclerView.Adapter<InformePrototype>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): InformePrototype {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.prototype_informe, parent, false)

        return  InformePrototype(view)
    }

    //tamaño
    override fun getItemCount(): Int {
        return informes.size
    }

    //Conecta la información con la vista
    override fun onBindViewHolder(informePrototype: InformePrototype, position: Int) {
        informePrototype.bind(informes.get(position))
    }
}

class InformePrototype(itemView: View) : RecyclerView.ViewHolder(itemView) {
    val tvDescripcion = itemView.tvDescripcion
    val tvCalificacion = itemView.tvCalificacion

    fun bind(informe : Informe){
        tvDescripcion.text = informe.descripcion
        tvCalificacion.text = informe.calificacion
    }
}