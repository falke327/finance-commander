package de.falke.financecommander.bank;

import lombok.*;

import javax.persistence.*;

@ToString
@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "Bank")
@Table(name = "bank")
public class Bank {

    @Id
    @Column(
            name = "bic",
            nullable = false,
            columnDefinition = "TEXT"
    )
    private String bic;

    @Column(
            name = "bank_name",
            nullable = false,
            columnDefinition = "TEXT"
    )
    private String bankName;
}
