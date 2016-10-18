/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.grupo7.lavajato.model;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Adriano
 */
@Entity
@Table(name = "lavagem")
public class Lavagem {
    
    public enum STATUS_LAVAGEM {
        EM_ESPERA, SENDO_LAVADO, FINALIZADO;
    }
    
    @Id
    @Column(name = "id")
    @GeneratedValue
    private int id;
    @Column(name = "data", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private Date data;
    @Column(name = "hora_entrada")
    private int horaEntrada;
    @Column(name = "hora_saida")
    private int horaSaida;
    @Column(name = "valor_pago")
    private double valorPago;
    @Column(name = "status")
    private STATUS_LAVAGEM status;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_cliente")
    private Cliente cliente;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_veiculo")
    private Veiculo veiculo;
    
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_tipo_lavagem")
    private TipoLavagem tipoLavagem;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public int getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(int horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public int getHoraSaida() {
        return horaSaida;
    }

    public void setHoraSaida(int horaSaida) {
        this.horaSaida = horaSaida;
    }

    public double getValorPago() {
        return valorPago;
    }

    public void setValorPago(double valorPago) {
        this.valorPago = valorPago;
    }

    public STATUS_LAVAGEM getStatus() {
        return status;
    }

    public void setStatus(STATUS_LAVAGEM status) {
        this.status = status;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Veiculo getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public TipoLavagem getTipoLavagem() {
        return tipoLavagem;
    }

    public void setTipoLavagem(TipoLavagem tipoLavagem) {
        this.tipoLavagem = tipoLavagem;
    }
         
}
