/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.bean.Clientes;

/**
 *
 * @author José Ygor
 */
public class ClientesDAO {

    Connection con;
    
    public ClientesDAO() {
        con = ConnectionFactory.getConnection();
    }
    
    public void create(Clientes p) {

        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("INSERT INTO projeto (descricao,quantidade,nome_cliente,cod_projeto,ativo)VALUES(?,?,?,?,1)");
            stmt.setString(1, p.getDescricao());
            stmt.setInt(2, p.getQtd());
            stmt.setString(3, p.getNome());
            stmt.setInt(4, p.getCodigo());

            stmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Salvo com sucesso!");
        } catch (SQLException ex) {
            System.out.println(ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }

    public List<Clientes> read() {

        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Clientes> projetos = new ArrayList<>();

        try {
            stmt = con.prepareStatement("SELECT * FROM projeto");
            rs = stmt.executeQuery();

            while (rs.next()) {

                Clientes projeto = new Clientes();
                   
                projeto.setId(rs.getInt("id"));
                projeto.setCodigo(rs.getInt("cod_projeto"));
                projeto.setNome(rs.getString("nome_cliente"));
                projeto.setDescricao(rs.getString("descricao"));
                projeto.setQtd(rs.getInt("quantidade"));
                projetos.add(projeto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClientesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }

        return projetos;

    }
    public List<Clientes> readForDesc(String nome) {

        PreparedStatement stmt = null;
        ResultSet rs = null;

        List<Clientes> projetos = new ArrayList<>();

        try {
            stmt = con.prepareStatement("SELECT * FROM projeto WHERE nome_cliente LIKE ?");
            stmt.setString(1, "%"+nome+"%");
            
            rs = stmt.executeQuery();

            while (rs.next()) {

                Clientes projeto = new Clientes();
                
                projeto.setId(rs.getInt("id"));
                projeto.setCodigo(rs.getInt("cod_projeto"));
                projeto.setNome(rs.getString("nome_cliente"));
                projeto.setDescricao(rs.getString("descricao"));
                projeto.setQtd(rs.getInt("quantidade"));
                projetos.add(projeto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ClientesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt, rs);
        }

        return projetos;

    }

    public void update(Clientes p) {

        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("UPDATE projeto SET descricao = ? ,quantidade = ?,nome_cliente = ?,cod_projeto = ?,ativo = 1 WHERE id = ?");
            stmt.setString(1, p.getDescricao());
            stmt.setInt(2, p.getQtd());
            stmt.setString(3, p.getNome());
            stmt.setInt(4, p.getCodigo());
            stmt.setInt(5, p.getId());
//            stmt.setInt(6, p.getId());

            stmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Atualizado com sucesso!");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao atualizar: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }
    public void delete(Clientes p) {

        PreparedStatement stmt = null;

        try {
            stmt = con.prepareStatement("DELETE FROM projeto WHERE id = ?");
            stmt.setInt(1, p.getId());

            stmt.executeUpdate();

            JOptionPane.showMessageDialog(null, "Excluido com sucesso!");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Erro ao excluir: " + ex);
        } finally {
            ConnectionFactory.closeConnection(con, stmt);
        }

    }

}
