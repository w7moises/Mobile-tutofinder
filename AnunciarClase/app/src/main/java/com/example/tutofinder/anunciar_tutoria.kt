package com.example.tutofinder

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import kotlinx.android.synthetic.main.activity_anunciar_clase.*

class anunciar_tutoria : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_anunciar_clase)
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
        val modalidad = etModalidad.text.toString()
        val curso = etCurso.text.toString()
        val tiempo = etTiempo.text.toString()
        val intent = Intent()

        intent.putExtra("KeyModalidad", modalidad)
        intent.putExtra("KeyCurso", curso)
        intent.putExtra("KeyTiempo", tiempo)

        setResult(Activity.RESULT_OK, intent)
        finish()
    }
}