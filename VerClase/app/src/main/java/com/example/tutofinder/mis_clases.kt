package com.example.tutofinder

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.activity_mis_clases.*

class mis_clases : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_mis_clases)

        ibInforme.setOnClickListener{
            val intent: Intent = Intent(this, ver_informe::class.java)
            startActivity(intent)
        }
    }
}