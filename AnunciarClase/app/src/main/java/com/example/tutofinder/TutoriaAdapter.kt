package com.example.tutofinder

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.prototype_tutoria.view.*

class TutoriaAdapter(var tutorias: ArrayList<Tutoria>): RecyclerView.Adapter<TutoriaPrototype>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): TutoriaPrototype {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.prototype_tutoria, parent, false)

        return  TutoriaPrototype(view)
    }

    //tamaño
    override fun getItemCount(): Int {
        return tutorias.size
    }

    //Conecta la información con la vista
    override fun onBindViewHolder(tutoriaPrototype: TutoriaPrototype, position: Int) {
        tutoriaPrototype.bind(tutorias.get(position))
    }
}

class TutoriaPrototype(itemView: View) : RecyclerView.ViewHolder(itemView) {
    val tvModalidad = itemView.tvModalidad
    val tvCurso = itemView.tvCurso
    val tvTiempo = itemView.tvTiempo

    fun bind(tutoria : Tutoria){
        tvModalidad.text = tutoria.modalidad
        tvCurso.text = tutoria.curso
        tvTiempo.text = tutoria.tiempo
    }
}