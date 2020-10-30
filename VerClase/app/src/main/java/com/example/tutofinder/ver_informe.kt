package com.example.tutofinder

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_ver_informe.*

class ver_informe : AppCompatActivity() {
    val REQUEST_CODE = 1
    var informes = ArrayList<Informe>()
    var informeAdapter = InformeAdapter(informes)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_ver_informe)
        loadInformes()
        initView()
    }

    fun loadInformes() {
        informes.add(Informe("Problemas en ecuacion de segundo grado","14"))
    }

    private fun initView() {
        rvInforme.adapter = informeAdapter
        rvInforme.layoutManager = LinearLayoutManager(this)
    }
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater: MenuInflater = menuInflater
        inflater.inflate(R.menu.main_menu, menu)
        return true
    }
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val intent = Intent(this, crear_informe::class.java)
        startActivityForResult(intent, REQUEST_CODE)

        return super.onOptionsItemSelected(item)
    }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == REQUEST_CODE){
            if (resultCode == Activity.RESULT_OK){
                val descripcion = data!!.getStringExtra("KeyDescripcion")
                val calificacion = data!!.getStringExtra("KeyCalificacion")

                val informe = Informe(descripcion,calificacion)

                informes.add(informe)
            }
        }
    }
}