package com.example.tutofinder

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main);

        ibMisClases.setOnClickListener{
            val intent:Intent = Intent(this, mis_clases::class.java)
            startActivity(intent)
        }
        ibAnuncios.setOnClickListener{
            val intent:Intent = Intent(this, MisAnuncios::class.java)
            startActivity(intent)
        }

    }
}