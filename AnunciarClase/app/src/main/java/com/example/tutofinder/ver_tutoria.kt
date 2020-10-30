package com.example.tutofinder

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_ver_tutoria.*

class ver_tutoria : AppCompatActivity() {
    val REQUEST_CODE = 1
    var tutorias = ArrayList<Tutoria>()
    var tutoriaAdapter = TutoriaAdapter(tutorias)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_ver_tutoria)
        loadTutorias()
        initView()
    }

    fun loadTutorias() {
        tutorias.add(Tutoria("Virtual","Algebra","50"))
    }

    private fun initView() {
        rvTutoria.adapter = tutoriaAdapter
        rvTutoria.layoutManager = LinearLayoutManager(this)
    }
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater: MenuInflater = menuInflater
        inflater.inflate(R.menu.main_menu, menu)
        return true
    }
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val intent = Intent(this, anunciar_tutoria::class.java)
        startActivityForResult(intent, REQUEST_CODE)

        return super.onOptionsItemSelected(item)
    }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == REQUEST_CODE){
            if (resultCode == Activity.RESULT_OK){
                val modalidad = data!!.getStringExtra("KeyModalidad")
                val curso = data!!.getStringExtra("KeyCurso")
                val tiempo = data!!.getStringExtra("KeyTiempo")
                val informe = Tutoria(modalidad, curso, tiempo)

                tutorias.add(informe)
            }
        }
    }
}