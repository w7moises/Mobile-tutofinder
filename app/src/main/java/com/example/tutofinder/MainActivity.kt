package com.example.tutofinder

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageButton
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main);

        ibAnuncios.setOnClickListener{
            val intent:Intent = Intent(this, mis_anuncios::class.java)
            startActivity(intent)
        }

    }
}