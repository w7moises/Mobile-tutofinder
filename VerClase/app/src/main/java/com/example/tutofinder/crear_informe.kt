package com.example.tutofinder

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import kotlinx.android.synthetic.main.activity_crear_informe.*

class crear_informe : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_crear_informe)
    }
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        val inflater:MenuInflater = menuInflater
        inflater.inflate(R.menu.contact_menu, menu)
        return true
    }
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        saveContact()
        return super.onOptionsItemSelected(item)
    }

    private fun saveContact() {
        val descripcion = etDescripcion.text.toString()
        val calificacion = etCalificacion.text.toString()

        val intent = Intent()

        intent.putExtra("KeyDescripcion", descripcion)
        intent.putExtra("KeyCalificacion", calificacion)

        setResult(Activity.RESULT_OK, intent)
        finish()
    }
}